#!/bin/sh

if [ $# -ge 1 -a -d "$1" ] ; then
    VOLUMEOPTS="--volume $(cd "$1" && pwd -P):/project"
fi

podman container \
    run \
    -it \
    $VOLUMEOPTS \
    --name d10-aarch64-cross \
    --replace \
    d10-clang-aarch64-linux-gnu:1.0 \
    /bin/bash
