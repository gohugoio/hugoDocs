#!/usr/bin/env ruby

# Migrate classes in the whole project using configuration in `tachyons_to_tailwind.yml`.
# Intended for migrating Tachyons utility CSS to Tailwind CSS.
#
# See https://dev.to/nejremeslnici/migrating-tachyons-to-tailwind-css-part-i-ich for more context.
#
# To use this, do the following:
#
# Make this scrint executable: `chmod a+x tachyons_to_tailwind.rb`.
#
# Prepare the configuration file (see docs in `tachyons_to_tailwind.yml`).
#
# Run the script: `./tachyons_to_tailwind.rb`.
#
# Configuration here:
# - TEMPLATE_GLOBS - globs that will be searched for files to migrate classes in
# - MIGRATED_CLASSES_FILE - name of the list of already migrated classes (useful for purging Tailwind CSS while migrating)
# - REPLACEMENTS_TO_GREP_FILE - used internally for speed optimization

require "yaml"

# this should be generally the same as "purge.content" in tailwind.config.js
TEMPLATE_GLOBS = %w[layouts/**/*.html themes/newtheme/layouts/**/*.html].freeze
# this file is used for purgeCSS to remove all not-yet-migrated classes
MIGRATED_CLASSES_FILE = "migrated_classes.txt".freeze
REPLACEMENTS_TO_GREP_FILE = "/tmp/replacements.txt".freeze

config = YAML.load_file(File.join(__dir__, "tachyons_to_tailwind.yml"))
# pp config

def merge_replacements_with_variants(replacements:, variants: {})
  replacements_var = replacements.dup
  variants.each do |tachyons_variant, tailwind_variant|
    replacements.each do |tachyons_class, tailwind_class|
      replacement = if tailwind_class.is_a?(Array)
                      tailwind_class.map { |tw_class| "#{tailwind_variant}:#{tw_class}" }
                    else
                      "#{tailwind_variant}:#{tailwind_class}"
                    end
      replacements_var["#{tachyons_class}-#{tachyons_variant}"] = replacement
    end
  end
  replacements_var
end

def file_matches?(file, replacements_file: REPLACEMENTS_TO_GREP_FILE)
  system("grep -qf #{replacements_file} #{file}")
end

def possibly_matching_classes(file, replacements_file: REPLACEMENTS_TO_GREP_FILE)
  matches = `grep -f #{replacements_file} -os #{file}`
  matches.split.sort.uniq
end

def replace_classes(file, replacements: {}, exceptions: {})
  classes_to_consider = possibly_matching_classes(file)

  old_stdout = $stdout
  argf = ARGF.clone

  argf.argv.replace [file]
  argf.inplace_mode = ""

  shown_file = false
  replaced = 0

  argf.each_line do |line|
    filename = argf.filename
    line_number = argf.file.lineno

    replacements.each do |tachyons_class, tailwind_class|
      #next unless classes_to_consider.find { |class_name| tachyons_class.start_with?(class_name) }
      #old_stdout.puts "Considering #{tachyons_class}"

      # skip line if in exceptions for the given class name
      ignored_classes = exceptions.dig(filename, tachyons_class)
      next if ignored_classes && (ignored_classes.empty? || ignored_classes.include?(line_number))
      next unless line.include?(tachyons_class)


      # regex for the class name:
      regex = %r{(?<char_before>
                   [.'"]                   # preceded by .'"
                   |                       # or
                   (?<![\ :;=|])[ ]        # preceded by space but not by the other chars before the space
                 )
                 \b#{tachyons_class}\b     # match whole words only
                 (?![-(\[\]/|?!])          # not followed by special chars
                 }x



      next unless line.match(regex)

      tw_replacement = tailwind_class
      if tailwind_class.is_a?(Array)
        joining_char = Regexp.last_match(:char_before) == "." ? "." : " "
        tw_replacement = tailwind_class.join(joining_char)
      end

      #old_stdout.puts filename unless shown_file
      #old_stdout.puts "  #{line_number}: #{tachyons_class} ⟶ #{tw_replacement}"

      line.gsub!(regex, "\\k<char_before>#{tw_replacement}")

      shown_file = true
      replaced += 1
    end

    puts line
  end

  argf.close
  $stdout = old_stdout

  replaced
end

def update_migrated_classes_file(replacements:)
  File.open(MIGRATED_CLASSES_FILE, "w") do |file|
    replacements.values.flatten.sort.uniq.each do |tailwind_class|
      file.puts(tailwind_class)
    end
  end
end

# load replacements but ignore already migrated classes
replacements = config["replacements"]
replacements_to_migrate = replacements.dup
already_migrated = config["already_migrated"] || []
already_migrated.each do |tachyons_class|
  unless replacements_to_migrate.key?(tachyons_class)
    raise "cannot find replacement for already migrated Tachyons class '#{tachyons_class}'"
  end

  replacements_to_migrate.delete(tachyons_class)
end

# save replacements one-per line so that we can grep the files efficiently (speed optimization)
File.open(REPLACEMENTS_TO_GREP_FILE, "w") do |file|
  replacements_to_migrate.each_key do |tachyons_class|
    file.puts tachyons_class
  end
end

replacements_with_variants = merge_replacements_with_variants(replacements: replacements_to_migrate,
                                                              variants: config["variants"])
exceptions = config["exceptions"]

replaced = files = 0
TEMPLATE_GLOBS.each do |glob|
  puts "Searching in #{glob}..."
  file_exceptions = Dir.glob(config["glob_exceptions"])

  Dir.glob(glob).each do |file|
    #puts "Considering #{file}"
    next unless File.file?(file)
    next if file_exceptions.include?(file)
    next unless file_matches?(file)

    changes = replace_classes(file, replacements: replacements_with_variants, exceptions: exceptions)

    if changes.positive?
      files += 1
      replaced += changes
    end
  end
end

puts "Replaced #{replaced} classes in #{files} files."

puts "Updating #{MIGRATED_CLASSES_FILE}."
# convert to hash class => class
already_migrated = Hash[* already_migrated.flat_map { |class_name| [class_name, replacements[class_name]] }]
migrated_with_variants = merge_replacements_with_variants(replacements: already_migrated, variants: config["variants"])
update_migrated_classes_file(replacements: replacements_with_variants.merge(migrated_with_variants))
