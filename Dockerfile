FROM alpine:3.19

# Install base dependencies
RUN apk add --no-cache \
    bash curl git unzip wget build-base cmake ninja tree-sitter \
    gettext gettext-dev \
    python3 py3-pip \
    nodejs npm \
    ripgrep fd

# Build Neovim nightly from source
WORKDIR /tmp
RUN git clone --depth 1 https://github.com/neovim/neovim.git
WORKDIR /tmp/neovim
RUN make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=/usr/local && make install
WORKDIR /

COPY entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

COPY ./config/nvim/ /root/.config/nvim

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]

