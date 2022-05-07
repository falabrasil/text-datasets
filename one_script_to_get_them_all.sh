#!/usr/bin/env bash
#
# author: may 2022
# cassio batista - https://cassota.gitlab.io

set -e

dir=datasets
mkdir -p $dir || exit 1

echo "$0: downloading oscar"
src/fetch/get_oscar.sh $dir || exit 1
