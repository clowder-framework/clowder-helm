#!/bin/bash

# CORE EXTRACTORS
for x in digest image-preview image-metadata audio-preview pdf-preview video-preview; do
  URL="https://raw.githubusercontent.com/clowder-framework/extractors-core/master/$(echo $x | sed 's#-#/#g' )/extractor_info.json"
  VERSION=$(curl -s ${URL} | awk '/"version":/ { print $2}' | sed 's/[",]//g')
  sed -i~ "s/extractors-$x:.*/extractors-$x:${VERSION}/" values.yaml
done

# ARCHIVAL EXTRACTORS
for x in archival-disk archival-s3; do
  URL="https://raw.githubusercontent.com/clowder-framework/extractors-archival/master/${x}/extractor_info.json"
  VERSION=$(curl -s ${URL} | awk '/"version":/ { print $2}' | sed 's/[",]//g')
  sed -i~ "s/extractors-$x:.*/extractors-$x:${VERSION}/" values.yaml
done

# ZIP EXTRACTORS
for x in extract2folder inventory; do
  URL="https://raw.githubusercontent.com/clowder-framework/extractors-zip/main/${x}/extractor_info.json"
  VERSION=$(curl -s ${URL} | awk '/"version":/ { print $2}' | sed 's/[",]//g')
  sed -i~ "s/extractors-$x:.*/extractors-$x:${VERSION}/" values.yaml
done

# ANTI-VIRUS EXTRACTORS
VERSION=$(curl -s https://raw.githubusercontent.com/clowder-framework/extractors-clamav/main/extractor_info.json | awk '/"version":/ { print $2}' | sed 's/[",]//g')
sed -i~ "s/extractors-clamav:.*/extractors-clamav:${VERSION}/" values.yaml

# GEOSPATIAL EXTRACTORS
for x in geotiff-metadata geotiff-preview geoshp-preview; do
  URL="https://raw.githubusercontent.com/clowder-framework/extractors-geo/master/$(echo $x | sed 's#\([a-z]*\)-\([a-z]*\)#\2.\1#g' )/extractor_info.json"
  VERSION=$(curl -s ${URL} | awk '/"version":/ { print $2}' | sed 's/[",]//g')
  sed -i~ "s/extractors-$x:.*/extractors-$x:${VERSION}/" values.yaml
done
