#!/bin/sh

if [ -f src/schematics/collection.json ]; then
  cp src/schematics/collection.json dist/schematics/collection.json
fi

find src/schematics -name files | egrep 'files$' | while read src; do
  dist=$(echo $src | sed 's/src/dist/' | sed 's|/files$||')
  cp -rf $src $dist
done

find src/schematics -name schema.json | while read src; do
  dist=$(echo $src | sed 's/src/dist/' | sed 's|/schema.json||')
  cp -f $src $dist
done
