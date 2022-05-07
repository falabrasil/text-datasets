#!/usr/bin/env bash
#
# author: may 2022
# cassio batista - https://cassota.gitlab.io

user=
pass=
baseurl=https://oscar-prive.huma-num.fr/2201/packaged/pt_meta

[ $# -ne 1 ] && echo "usage: $0 <dir>" && exit 1
dir=$1

[[ -z $user || -z $pass ]] && \
  echo "$0: error: please set your credetials to huma-num.fr" && exit 1

mkdir -p $dir || exit 1
for i in $(seq 1 171) ; do
  f=pt_meta_part_$i.jsonl.gz
  [ -f $dir/$f ] && \
    echo "$0: warn: $f exists under $dir. skipping download..." && continue
  wget --user $user --password $pass --quiet --show-progress \
    $baseurl/$f -P $dir || exit 1
done

echo "$0: info: success!"
