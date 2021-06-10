FROM debian:buster-slim

# install packages needed for cmake compilation
RUN yes | \
    apt-get update && apt-get install -y --no-install-recommends \
        build-essential crossbuild-essential-arm64 libssl-dev \
        clang llvm \
	ninja-build \
        wget \
        && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    wget --no-check-certificate https://github.com/Kitware/CMake/releases/download/v3.20.3/cmake-3.20.3.tar.gz && \
        tar xvzf cmake-3.20.3.tar.gz && \
        cd cmake-3.20.3 && \
        ./bootstrap --generator=Ninja --prefix=/opt/cmake && \
        ninja install && \
        cd .. && \
        rm -rf cmake-3.20.3* && \
    mkdir /usr/aarch64-linux-gnu/usr && \
        ln -sf /usr/aarch64-linux-gnu /usr/aarch64-linux-gnu/usr/aarch64-linux-gnu

ENV CMAKE_ROOT /opt/cmake
ENV PATH ${PATH}:${CMAKE_ROOT}/bin

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections
