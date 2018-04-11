#!/bin/bash

echo "Check that there is a remote repo of your pod called origin"
[ $(git remote | grep ^origin$) = origin ] || exit 1
echo ok
echo

[[ -n "$BITRISE_PULL_REQUEST" ]] && echo This is a pull request. No pod deployment will be done. && exit 0
echo This is not a pull request


BRANCH=$BITRISE_GIT_BRANCH
[ ! "$BRANCH" ] && BRANCH=$(git rev-parse --abbrev-ref HEAD)
echo Current branch: $BRANCH
MASTER_BRANCH=master
echo

if [[ "$BRANCH" != "$MASTER_BRANCH" ]]; then
    echo "Deploying on a branch other than $MASTER_BRANCH. No pod deployment will be done."
    exit 0
else
  echo We are on the master branch
fi
echo

echo Look for podspec in $(pwd)
SPECFILE=$(ls *.podspec|head -n 1)
[ ! "$SPECFILE" ] && echo "Error: could not find podspec in current directory." && exit 1
echo "Podspec file: $SPECFILE"
echo

echo Read new pod version from podspec
NEWVERSION=$(cat *.podspec | grep -e 's.version\s*=' | cut -d \' -f2)
[ ! "$NEWVERSION" ] && echo "Error: could not read s.version from $SPECFILE" && exit 1
echo "New pod version: $NEWVERSION"
envman add --key NEW_VERSION --value "$NEWVERSION"
echo

echo Check that new version is compliant with format X.Y.Z
FORMATCHECK=$(echo $NEWVERSION | grep -E '^\d+\.\d+\.\d+$')
[ ! "$FORMATCHECK" ] && echo "Error: $NEWVERSION is not in the correct format X.Y.Z" && exit 1
echo ok
echo

echo Retrieve full list of tags from remote repository
TAGLIST=$(git ls-remote --tags origin | cut -f2 | cut -d "/" -f3 | grep -v '\^' | egrep '\d+\.\d+\.\d+')
echo $(echo "$TAGLIST" | wc -l) X.Y.Z tags found
echo

echo Extract latest version from tag list
LATESTVERSION=$(echo "$TAGLIST" | cut -f2 | cut -d "/" -f3 | grep -v '\^' | egrep '\d+\.\d+\.\d+' \
    | ruby -e '$last=Gem::Version.new(""); ARGF.each do |l|; $v=Gem::Version.new(l); if($v>$last);$last=$v;end; end; puts($last.to_s)')
[ ! "$LATESTVERSION" ] && echo "Error: could not retrieve latest version number"
echo Latest version: $LATESTVERSION
echo

echo Check that the latest version is strictly lower than the new version
RBCMD=$(printf "if(Gem::Version.new('$LATESTVERSION')<Gem::Version.new('$NEWVERSION')); Process.exit(1); end")
ruby -e "$RBCMD" && echo "Error: new version $NEWVERSION must be higher than latest version $LATESTVERSION" && exit 0
echo ok
echo

echo "Check that you have added the remote podspec repo and it is called master:"
PUBLICSPECREPO=$(pod repo list | grep ^master$)
[ "$PUBLICSPECREPO" = master ] || pod repo add master https://github.com/Cocoapods/Specs.git
echo ok
echo

echo Tag release with $NEWVERSION
git tag -a "$NEWVERSION" -m "$NEWVERSION"
echo

echo Push tag to pod repository
git push --follow-tags origin HEAD:$BRANCH
echo

echo Push pod to Cocoapods
time pod trunk push $SPECFILE
