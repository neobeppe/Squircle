#!/bin/bash

echo Read new pod version from podspec
NEWVERSION=$(cat *.podspec | grep -e 's.version\s*=' | cut -d \' -f2)
[ ! "$NEWVERSION" ] && echo "Error: could not read s.version from $SPECFILE" && exit 1
echo "New pod version: $NEWVERSION"
envman add --key NEW_VERSION --value "$NEWVERSION"
echo

# Checkout gh-pages branch.
if [ `git branch | grep gh-pages` ]
then
    git branch -D gh-pages
fi
git checkout -b gh-pages

# build docs now
jazzy --podspec Squircle.podspec

# Delete and move files.
find . -maxdepth 1 ! -name 'docs' ! -name '.git' ! -name '.gitignore' -exec rm -rf {} \;
mv docs/* .
rm -R docs/
touch .nojekyll

# Push to gh-pages.
git add -fA
git commit --allow-empty -m "Docs: "$NEW_VERSION""
git push -f -q origin gh-pages > /dev/null 2>&1
