FROM  docker.io/fedora:latest

# Install base dependencies
RUN dnf upgrade -y && dnf install -y dnf-plugins-core 
RUN dnf install -y \
    bash curl git unzip wget rsync \
    make automake gcc gcc-c++ kernel-devel \
    cmake ninja-build tree-sitter \
    gettext gettext-devel \
    python3 python3-pip \
    nodejs npm \
    ripgrep fd-find \
    && dnf clean all


# Build Neovim nightly from source
WORKDIR /tmp
RUN git clone --depth 1 https://github.com/neovim/neovim.git
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/root/.local && \
    make install && rm -rf /tmp/neovim

# NvChad for base configuration from git
WORKDIR /root
RUN git clone https://github.com/NvChad/starter ~/.config/nvim 
COPY ./config/nvim/ /root/.config/nvim
RUN nvim --headless "+Lazy! sync" +qa
RUN nvim --headless "+MasonInstallAll" +qa
RUN nvim --headless "+MasonUpdate" +qa

# Container entrpoint
COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh


ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

