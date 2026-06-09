ARG BUILD_BASE=ubuntu:26.04
FROM $BUILD_BASE
ENV DEBIAN_FRONTEND=noninteractive
RUN rm /etc/dpkg/dpkg.cfg.d/excludes
RUN apt-get update && apt-get install --no-install-recommends -y \
    autoconf \
    bc \
    binfmt-support \
    bison \
    build-essential \
    ca-certificates \
    ccache \
    chrpath \
    clang \
    clang-c++ \
    cmake \
    cpio \
    cpp \
    curl \
    debootstrap \
    device-tree-compiler \
    diffstat \
    direnv \
    dosfstools \
    fakeroot \
    file \
    flex \
    fzf \
    gawk \
    gcc-multilib-x86-64-linux-gnu \
    gcc-riscv64-linux-gnu \
    gcc-x86-64-linux-gnu \
    gdb \
    gdisk \
    git \
    less \
    libclang-dev \
    libcrypt-dev \
    libelf-dev \
    libfdt-dev \
    libffi-dev \
    libfl-dev \
    libfl2 \
    libglib2.0-dev \
    libreadline-dev \
    libssl-dev \
    llvm \
    llvm-dev \
    locales \
    man \
    man-db \
    manpages-posix \
    meson \
    mtools \
    ninja-build \
    openssh-server \
    python3 \
    python3-dev \
    python3-setuptools \
    python3-venv \
    qemu-user-binfmt \
    runit \
    sudo \
    tmux \
    uidmap \
    unminimize \
    vim-nox \
    wget \
    zip \
    zlib1g \
    zlib1g-dev \
    zsh \
    zstd
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
RUN yes | unminimize
RUN groupadd --system kvm
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "%sudo   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY --chmod=0755 entrypoint.sh /usr/sbin/entrypoint.sh
ENV PATH="/usr/lib/ccache/:${PATH}"
ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
