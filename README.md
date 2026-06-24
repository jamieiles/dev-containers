# Development Container Images for macos

A set of images for Linux based development on macos.  Images use the
containerization framework to minimize utilization and are used as lightweight
VMs.

Each image has an `enter` script that will rebuild the image if any of
the files have changed prior to entry.

## Assumptions

  - /Volumes/src contains any source code to be used in the container and is
  case-sensitive

## kernel

Kernel development focus

  - compilers for AArch64, x86 and RISC-V 
  - dependencies for Linux kernel and kvmtool
  - all capabilities to allow mounting raw devices
  - virtualization enabled and /dev/kvm accessible by unprivileged users

## Setup

```bash
# Install Rosetta
softwareupdate --install-rosetta --agree-to-license

# Start the containerization service
container system start --enable-kernel-install

git clone https://github.com/apple/containerization.git
cd containerization/kernel
make
# Build a new kernel with virtualization enabled
container system kernel set --binary vmlinux-arm64 --force

sudo container system dns create container-dev
# Make default containers use container-dev domain to allow resolving
# container IPs by hostname
mkdir -p ~/.config/container
echo "[dns]\ndomain = \"container-dev\"" > ~/.config/container/config.toml
```
