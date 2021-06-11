# Environment to reproduce vscode cmake-tools issue #1188

See https://github.com/microsoft/vscode-cmake-tools/issues/1188

## Step1: Build the container

The script uses podman, but you can switch to docker if need be by
modifying the script source code and replacing the podman call with
a docker call

    ./container/build-image.sh

That container image is based off:

- a simple debian 10 slim image
- where an upstream cmake 3.20.3 is compiled/installed from source
- the arm64 foreign arch is added and a clang c++ simple dev environment
  is installed

## Step2: Running the container

    ./container/test-container.sh project


## Step3: Use the project within the container in vscode

1. Spawn vscode
2. Use remote-container to connect to the running
   d10-clang-aarch64-linux-gnu:1.0 container
3. Copy the VSIX from https://github.com/microsoft/vscode-cmake-tools/issues/1188#issuecomment-857443445
   in the host ./project directory
4. Ctrl+Shift+P Extensions Install from VSIX ...
   and install the copied VSIX iwithin the container
5. Install any necessary plugin within the container: C/C++, CMake
6. Select the clang-aarch64 build kit
7. Ctrl+Shift+P Cmake: Configure

Then the bug occurs, despite the toolchain file setting up a clangaarch64 build of
the hello world project, it setups intellisense for clang-x64.
