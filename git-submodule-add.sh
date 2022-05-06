#!/bin/sh
cd $1
submodule_url=$(git remote get-url origin)
cd ..
git submodule add $submodule_url $1
