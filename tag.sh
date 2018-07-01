#!/bin/bash

setup_git() {
    git config --global user.email "travis@travis-ci.org"
    git config --global user.name "Travis CI"
}

create_tag() {
    describe=$(git describe --tags --first-parent --long)
    ltag=$(echo $describe | cut -d- -f1)
    commits=$(echo $describe | cut -d- -f2)
    if [ $commits != "0" ]; then
        ntag=$(echo $ltag | awk -F. '{print $1"."$2"."$3+1}')
        git tag $ntag
        echo Created tag $ntag
    else
        echo Tag was already created $ltag
    fi
}

push_tag() {
    git remote set-url origin https://${GH_TOKEN}@github.com/diego-alves/hello-aws.git
    git push --tags
}

setup_git
create_tag
push_tag
