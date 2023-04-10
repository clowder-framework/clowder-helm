#!/bin/bash

docker run -it --rm -v $(pwd):/data mogensen/helm-changelog:latest

version="$(awk '/^version:/ { print $2} ' Chart.yaml)"
changelog="$(sed -e "1,/^## ${version}/d" -e "/^###/,\$d" -e '/^$/d' -e 's/^* /- /' -e 's/^/    /' CHANGELOG.md | grep '^    - ' | sed -e 's/\ *$//g' | sed 's/    - \(.*\)/    - "\1"/g')"
sed -i~ -e '/^  artifacthub.io\/changes: |/,$d' Chart.yaml
echo "  artifacthub.io/changes: |" >> Chart.yaml
echo "${changelog}" >> Chart.yaml
