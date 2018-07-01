#!/bin/bash

git config --global user.email "travis@travis-ci.org"
git config --global user.name "Travis CI"

git tag v$(git describe --tags --first-parent | grep -oP "\d+\.\d+.\d+" | awk -F. '{print $1"."$2"."$3+1}')

git remote set-url origin https://${GH_TOKEN}@github.com/diego-alves/hello-aws.git
git push --tags
