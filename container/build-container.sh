#!/bin/sh

mkdir -p $HOME/tmp/podman
TMPDIR=$HOME/tmp/podman \
    podman build \
        -t d10-clang-aarch64-linux-gnu:1.0 \
        .
