#!/bin/bash

git tag v$(git describe --tags | grep -oP "\d+\.\d+.\d+" | awk -F. '{print $1"."$2"."$3+1}')
git push --tags