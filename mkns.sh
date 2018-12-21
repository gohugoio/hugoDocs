## Get tpl packages
pkgs=`ls ../hugo/tpl/*/init.go | awk -F/ '{print $4;}'`

## Create docs sections for each package.
for pkg in $pkgs; do
  echo $pkg
  mkdir -p content/en/functions/$pkg;

  # Derive title from package name
  title=`echo -n $pkg | awk '{printf("%s%s\n",toupper(substr($0,1,1)),substr($0,2))}'`
  [[ "$title" == "Urls" ]] && title="URLs"

  # Derive description from godoc package description
  desc=`godoc ../hugo/tpl/$pkg/ | grep -m 1 -A4 ^package | tail -2 | xargs | sed 's/Package/Module/'`

  # Create module section index
  cat > content/en/functions/$pkg/_index.md <<EOF
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

## Move already-namespaced files
for f in `ls content/en/functions/*.*.md`; do
  mod=`basename $f | awk -F. '{print $1;}'`
  func=`basename $f | awk -F. '{print $2;}'`

  echo git mv $f content/en/$mod/${func}.md
done

## Move all funcs files to namespaces
for f in `ls content/en/functions/*.md`; do
  #echo f=$f

  arg=`basename $f | awk -F. '{print $1;}'`
  mod=`jq -r --arg arg $arg '(paths | select(.[-2] == "Aliases")) as $p | select(getpath($p) | test("^"+$arg+"$"; "i")) | $p[2]' data/docs.json`
  if [[ "$mod" == "" ]]; then
    echo "NOMODULE: $f"
    ## XXX
    continue
  fi

  func=`jq -r --arg arg $arg '(paths | select(.[-2] == "Aliases")) as $p | select(getpath($p) | test("^"+$arg+"$"; "i")) | $p[3]' data/docs.json`

  newfile="content/en/functions/$mod/${func}.md"

  ## Move to new location
  #echo git mv $f $newfile

  ## Add aliases
  #sed -rie "s/^aliases: \[(.*)\]/aliases: [\/en\/functions\/$func\/,\1]/" $newfile
  ## Remove any trailing ",]" in the aliases

done

## What do we do with built-in "with" and other functions we haven't replicated from text/template?
