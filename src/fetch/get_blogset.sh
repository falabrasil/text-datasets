#!/usr/bin/env bash
#
# author: may 2022
# cassio batista - https://cassota.gitlab.io

baseurl=https://www.inf.pucrs.br/linatural/blogs
f=blogset-br.csv.gz

[ $# -ne 1 ] && echo "usage: $0 <dir>" && exit 1
dir=$1

mkdir -p $dir || exit 1
[ -f $dir/$f ] && \
  echo "$0: warn: $f exists under $dir; skipping download..." && exit 0
wget --quiet --show-progress $baseurl/$f -P $dir || exit 1
echo "$0: info: success!"
