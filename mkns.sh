#!/bin/bash
#
# Requires:
#   * awk
#   * basename
#   * git
#   * grep
#   * head
#   * jq
#   * perl
#   * sed
#   * tail
#   * tr
#   * xargs

HUGO_REPO_PATH="../hugo"

## Get tpl packages from hugo repo
pkgs=`ls $HUGO_REPO_PATH/tpl/*/init.go | awk -F/ '{print $4;}'`

funcroot=content/en/functions

## Create docs sections for each package.
for pkg in $pkgs; do
  mkdir -p $funcroot/$pkg

  # Derive title from package name
  title=`echo -n $pkg | awk '{printf("%s%s\n",toupper(substr($0,1,1)),substr($0,2))}'`
  [[ "$title" == "Urls" ]] && title="URLs"
  [[ "$title" == "Os" ]] && title="OS"

  # Derive description from godoc package description
  desc=`godoc ../hugo/tpl/$pkg/ | grep -m 1 -A4 ^package | tail -2 | xargs | sed 's/Package/Module/'`

  # Create module section index
  echo "+ $funcroot/$pkg/_index.md"
  cat > $funcroot/$pkg/_index.md <<EOF
---
title: $title
description: $desc
date: 2018-11-29
publishdate: 2018-11-29
lastmod: 2018-11-29
menu:
  docs:
    parent: "functions"
---

$desc
EOF

done

## Commit the new sections for forthcoming git moves
git add $funcroot/*/
git commit -m "functions: Add namespace sub-sections"


## Create docs section for Go built-in functions
pkg=built-in
mkdir -p $funcroot/$pkg
echo "+ $funcroot/$pkg/_index.md"
cat > $funcroot/$pkg/_index.md <<EOF
---
title: Built-in
description: Functions built-in to Go templates.
date: 2018-11-29
publishdate: 2018-11-29
lastmod: 2018-11-29
menu:
  docs:
    parent: "functions"
---

Functions built-in to Go templates.
EOF
git add $funcroot/$obj
git commit -m "functions: Add built-in functions sub-section"


## Move already-namespaced files
for f in `ls $funcroot/*.*.md`; do
  mod=`basename $f | awk -F. '{print $1;}'`
  func=`basename $f | awk -F. '{print $2;}'`
  func="$(tr '[:upper:]' '[:lower:]' <<< $func)"

  newfile="$funcroot/$mod/${func}.md"

  echo git mv $f $newfile
  git mv $f $newfile

  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
done

## Move all funcs files to namespaces
for f in `ls $funcroot/*.md`; do
  arg=`basename $f | awk -F. '{print $1;}'`
  ## Skip the index
  if [[ "$arg" == "_index" ]]; then continue; fi
  ## Skip files we'll deal with later
  if [[ "$arg" == "index-function" ]]; then continue; fi
  if [[ "$arg" == "NumFmt" ]]; then continue; fi
  if [[ "$arg" == "base64" ]]; then continue; fi
  if [[ "$arg" == "math" ]]; then continue; fi
  if [[ "$arg" == "sha" ]]; then continue; fi
  if [[ "$arg" == "get" ]]; then continue; fi
  if [[ "$arg" == "GetPage" ]]; then continue; fi
  if [[ "$arg" == "param" ]]; then continue; fi
  if [[ "$arg" == "render" ]]; then continue; fi
  if [[ "$arg" == "scratch" ]]; then continue; fi
  if [[ "$arg" == "haschildren" ]]; then continue; fi
  if [[ "$arg" == "hasmenucurrent" ]]; then continue; fi
  if [[ "$arg" == "ismenucurrent" ]]; then continue; fi
  if [[ "$arg" == "adddate" ]]; then continue; fi
  if [[ "$arg" == "format" ]]; then continue; fi
  if [[ "$arg" == "unix" ]]; then continue; fi
  if [[ "$arg" == "time" ]]; then continue; fi
  if [[ "$arg" == "with" ]]; then continue; fi
  if [[ "$arg" == "range" ]]; then continue; fi
  if [[ "$arg" == "len" ]]; then continue; fi

  mod=`jq -r --arg arg $arg '(paths | select(.[-2] == "Aliases")) as $p | select(getpath($p) | test("^"+$arg+"$"; "i")) | $p[2]' data/docs.json | tail -1`
  if [[ "$mod" == "" ]]; then
    echo "UNHANDLED MODULE: $f"
    continue
  fi

  func=`jq -r --arg arg $arg '(paths | select(.[-2] == "Aliases")) as $p | select(getpath($p) | test("^"+$arg+"$"; "i")) | $p[3]' data/docs.json | tail -1`
  func="$(tr '[:upper:]' '[:lower:]' <<< $func)"

  newfile="$funcroot/$mod/${func}.md"

  ## Move to new location
  echo git mv $f $newfile
  git mv $f $newfile

  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$arg/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile

  ## TODO: Add alias if it's missing from file?

done

## Move index-function.md
f=$funcroot/index-function.md
mod=collections
func=index-function
newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$func/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile

## Move built-in functions
mod=built-in
for func in len range with; do
  f="$funcroot/${func}.md"
  newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$func/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
done


## Move time.md
f=$funcroot/time.md
mod=time
func=astime
newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$func/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile

## Move NumFmt.md
f=$funcroot/NumFmt.md
mod=lang
func=numfmt
newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$func/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile

## sha.md
f=$funcroot/sha.md
mod=crypto
m=SHA1
func="$(tr '[:upper:]' '[:lower:]' <<< $m)"
oldfunc=sha
newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Copy to sha256 XXX
  cp $newfile $funcroot/$mod/${oldfunc}256.md
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$oldfunc/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Fix content
  perl -pi -e "s/^title: sha/title: sha1/" $newfile
  perl -pi -e "s/linktitle: sha/linktitle: sha1/" $newfile
  perl -pi -e "s/^description:(.*)either an SHA1 or SHA256(.*)/description: \$1a SHA1\$2/" $newfile
  perl -pi -e "s/^signature: \[(.*), (.*)\]/signature: [\$1]/" $newfile
  # Add related
  perl -pi -e "s/^relatedfuncs: \[\]/relatedfuncs: [\"sha256\"]/" $newfile
  # trim sha256 lines
  tmpfile=/tmp/tmp.sha1.$$
  head -n -7 $newfile > $tmpfile && mv $tmpfile $newfile
#### sha256
  m=SHA256
  func="$(tr '[:upper:]' '[:lower:]' <<< $m)"
  newfile="$funcroot/$mod/${func}.md"
  echo "+ $newfile"
  ## Fix content
  perl -pi -e "s/^title: sha/title: sha256/" $newfile
  perl -pi -e "s/linktitle: sha/linktitle: sha256/" $newfile
  perl -pi -e "s/^description:(.*)either an SHA1 or SHA256(.*)/description: \$1a SHA256\$2/" $newfile
  perl -pi -e "s/^signature: \[(.*), (.*)\]/signature: [\$2]/" $newfile
  # Add related
  perl -pi -e "s/^relatedfuncs: \[\]/relatedfuncs: [\"sha1\"]/" $newfile
  # trim sha1 lines
  sed -i '19,25d' $newfile

## base64.md
f=$funcroot/base64.md
oldfunc=base64
mod=encoding
m=Base64Encode
func="$(tr '[:upper:]' '[:lower:]' <<< $m)"
newfile="$funcroot/$mod/${func}.md"
  echo git mv $f $newfile
  git mv $f $newfile
  ## Remove menu listing
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  ## Copy to base64Decode XXX
  cp $newfile $funcroot/$mod/${oldfunc}decode.md
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$oldfunc/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Fix content
  desc=`jq -r ".tpl.funcs.${mod}.${m}.Description" data/docs.json`
  perl -pi -e "s/^title: .*/title: $func/" $newfile
  perl -pi -e "s/linktitle: .*/linktitle: $func/" $newfile
  perl -pi -e "s/^description:.*/description: $desc/" $newfile
  perl -pi -e "s/^signature: \[(.*), (.*)\]/signature: [\$2]/" $newfile
  # Add related
  perl -pi -e "s/^relatedfuncs: \[\]/relatedfuncs: [\"base64Decode\"]/" $newfile
#### Base64Decode
  m=Base64Decode
  func="$(tr '[:upper:]' '[:lower:]' <<< $m)"
  newfile="$funcroot/$mod/${func}.md"
  echo "+ $newfile"
  ## Fix content
  desc=`jq -r ".tpl.funcs.${mod}.${m}.Description" data/docs.json`
  perl -pi -e "s/^title: .*/title: $func/" $newfile
  perl -pi -e "s/linktitle: .*/linktitle: $func/" $newfile
  perl -pi -e "s/^description:.*/description: $desc/" $newfile
  perl -pi -e "s/^signature: \[(.*), (.*)\]/signature: [\$1]/" $newfile
  # Add related
  perl -pi -e "s/^relatedfuncs: \[\]/relatedfuncs: [\"base64Encode\"]/" $newfile

## math.md
mod=math
echo git rm $funcroot/${mod}.md
git rm $funcroot/${mod}.md
for m in Add Sub Mul Div Mod ModBool Ceil Floor Round; do
  func="$(tr '[:upper:]' '[:lower:]' <<< $m)"
  desc=`jq -r ".tpl.funcs.${mod}.${m}.Description" data/docs.json`
  # TODO(moorereason): output all examples
  example=`jq -r ".tpl.funcs.${mod}.${m}.Examples[0][0]" data/docs.json`
  exampleOut=`jq -r ".tpl.funcs.${mod}.${m}.Examples[0][1]" data/docs.json`
  newfile="$funcroot/$mod/${func}.md"
  echo "+ $newfile"
  cat > $newfile <<EOF
---
title: $m
description: $desc
godocref:
date: 2017-02-01
publishdate: 2017-02-01
lastmod: 2017-02-01
keywords: [math, operators]
categories: [functions]
toc:
signature: []
workson: []
hugoversion:
relatedfuncs: []
deprecated: false
draft: false
aliases: []
---

$desc

\`\`\`
$example → $exampleOut
\`\`\`
EOF
done

## Fix refs
perl -pi -e "s#ref \"/functions/partialCached#ref \"/functions/partials/includecached#" content/en/troubleshooting/build-performance.md

## TODO: What do we do with built-in "with" and "range" functions?

##
## Objects
##

varroot=content/en/variables
objroot=content/en/objects
mkdir $objroot

## _index.md
file=$varroot/_index.md
newfile=$objroot/_index.md
  echo git mv $file $newfile
  git mv $file $newfile

  ## Add aliases
  perl -pi -e 's#^(aliases:) \[(.*)\]#$1 [/variables/,$2]#igs' $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Various
  perl -pi -e 's/^(title:) .*/$1 Objects/' $newfile
  perl -pi -e 's/^(linktitle:) .*/$1 Objects Overview/' $newfile
  perl -pi -e 's/^(description:) .*/$1 Objects available in Hugo templates./' $newfile
  perl -pi -e 's/^(categories:) .*/$1 [objects]/' $newfile
  perl -pi -e 's/^(keywords:) \[(.*)\]/$1 [objects,$2]/' $newfile
  perl -pi -e 's/^(\s+parent:) "variables"/$1 "objects"/igs' $newfile
  perl -pi -e 's/(a large number of) values/$1 objects/' $newfile

## Fix object files
for file in `ls $varroot/[a-z]*md`; do
  base=`basename $file | awk -F. '{print $1;}'`
  newfile=$objroot/$base/_index.md

  mkdir $objroot/$base

  echo git mv $file $newfile
  git mv $file $newfile

  ## Add aliases
  perl -pi -e "s#^(aliases:) \[(.*)\]#\$1 [/variables/${base}/,\$2]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Various
  perl -pi -e 's/^(title:) (.*)(?:Variables|Properties)(.*)/$1 $2Objects$3/' $newfile
  perl -pi -e 's/^(linktitle:) (.*)(?:Variables|Properties)(.*)/$1 $2Objects$3/' $newfile
  perl -pi -e 's/^(description:) (.*)variable(.*)/$1 $2object$3/' $newfile
  perl -pi -e 's/^(\s+parent:) "variables"/$1 "objects"/igs' $newfile
  perl -pi -e 's/^(categories:) .*/$1 [objects]/' $newfile
done

## Fix menu items in config.toml
for file in `ls config/_default/menus/menus*toml`; do
  perl -pi -e 's#^(\s+name =) "Variables"#$1 "Objects"#' $file
  perl -pi -e 's#^(\s+identifier =) "variables"#$1 "objects"#' $file
  perl -pi -e 's#^(\s+url =) "(.*)/variables/"#$1 "$2/objects/"#' $file
done

##
## Move old functions pages to objects
##


## Page
obj=page
mkdir $objroot/$obj

### move old function files
for f in param get GetPage render scratch hasmenucurrent ismenucurrent haschildren; do
  file=$funcroot/${f}.md
  meth="$(tr '[:upper:]' '[:lower:]' <<< $f)"
  newfile="$objroot/$obj/${meth}.md"

  echo git mv $file $newfile
  git mv $file $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$meth/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Others
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  perl -pi -e 's/^(categories:) .*/$1 [objects]/' $newfile
done

### Fix old links
for f in content/en/templates/introduction.md content/en/objects/page/_index.md; do
  perl -pi -e 's#\(/functions/scratch/?\)#(/objects/page/scratch/)#' $f
done
for f in content/en/templates/views.md; do
  perl -pi -e 's#/functions/render/#/objects/page/render/#' $f
done


## Time
obj=time
mkdir $objroot/$obj

### _index.md
file=$objroot/$obj/_index.md
echo "+ $file"
cat > $file <<EOF
---
title: Time Objects
linktitle:
description: Time objects
date: 2018-12-27
publishdate: 2018-12-27
lastmod: 2018-12-27
categories: [objects]
keywords: [time]
menu:
  docs:
    parent: "objects"
    weight: 20
weight: 20
sections_weight: 20
aliases: []
toc: true
---

Time Objects
EOF

### move old function files
for f in unix format adddate; do
  file=$funcroot/${f}.md
  meth="$(tr '[:upper:]' '[:lower:]' <<< $f)"
  newfile="$objroot/$obj/${meth}.md"

  echo git mv $file $newfile
  git mv $file $newfile
  ## Add aliases
  perl -pi -e "s#^aliases: \[(.*)\]#aliases: [/functions/$meth/,\$1]#igs" $newfile
  ## Remove any trailing ",]" in the aliases
  perl -pi -e 's/^(aliases: \[.*),\]/$1]/' $newfile
  ## Others
  perl -p0i -e 's/menu:\n\s+docs:\n\s+parent: "functions"\n//igs' $newfile
  perl -pi -e 's/^(categories:) .*/$1 [objects]/' $newfile
done
