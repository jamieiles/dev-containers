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
git clone https://github.com/apple/containerization.git
cd containerization/kernel
make
# Build a new kernel with virtualization enabled
sudo container system kernel set --binary vmlinux --force

sudo container system dns create dev
# Make default containers use dev domain to allow resolving
# container IPs by hostname
container system property set dns.domain dev
```
