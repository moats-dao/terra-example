#!/bin/sh
# https://gist.github.com/AndrianBdn/ae8cedaec5a5df30fdbf
# http://blog.davidecoppola.com/2015/02/how-to-create-git-submodule-from-repository-subdirectory/
#
# This script can clone/checkout a single folder from git repository 
# - Might be used for checking out micro-services from monolithic git repository
#
# - You can even do checkout into home directory, for example
#   git-sparse-clone.sh git@github.com:readdle/fluix-web.git /home/login login
#

# This will cause the shell to exit immediately if a simple command exits with a nonzero exit value.
set -e

[ $# -ne 3 ] && { echo "Usage: $0 <repository-URL> <repository-path> <local-repo-root-directory>"; exit 1; }

repo_url=$1
repo_path=$2
local_repo_root=$3

git clone $repo_url $local_repo_root
cd $local_repo_root
git config core.sparsecheckout true
echo "/$repo_path/**" > .git/info/sparse-checkout
git read-tree -m -u HEAD