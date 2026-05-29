ARG BUILD_BASE=ubuntu:26.04
FROM $BUILD_BASE
ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install --no-install-recommends -y \
    autoconf \
    bc \
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
    device-tree-compiler \
    diffstat \
    direnv \
    file \
    flex \
    fzf \
    gawk \
    gcc-riscv64-linux-gnu \
    gcc-x86-64-linux-gnu \
    gdb \
    git \
    less \
    libclang-dev \
    libcrypt-dev \
    libfdt-dev \
    libffi-dev \
    libfl-dev \
    libfl-dev \
    libfl2 \
    libreadline-dev \
    libssl-dev \
    llvm \
    llvm-dev \
    locales \
    python3 \
    python3-dev \
    runit \
    sudo \
    tmux \
    wget \
    zip \
    zlib1g \
    zlib1g-dev \
    zsh \
    zstd \
    && rm -rf /var/lib/apt/lists
RUN echo "en_US.UTF-8 UTF-8" >> /etc/locale.gen && locale-gen
RUN groupadd --system kvm
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN echo "%sudo   ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers
COPY --chmod=0755 entrypoint.sh /usr/sbin/entrypoint.sh
ENV PATH="/usr/lib/ccache/:${PATH}"
ENTRYPOINT ["/usr/sbin/entrypoint.sh"]
