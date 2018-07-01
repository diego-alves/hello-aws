#!/bin/bash

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git tag v$(git describe --tags | grep -oP "\d+\.\d+.\d+" | awk -F. '{print $1"."$2"."$3+1}')

git remote add origin-tags https://${GH_TOKEN}@github.com/diego-alves/hello-aws.git > /dev/null 2>&1
git push --quiet --set-upstream origin-tags master
