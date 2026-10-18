FROM nixos/nix:latest

RUN echo "experimental-features = nix-command flakes" >> /etc/nix/nix.conf

ENV NIXPKGS_ALLOW_UNFREE=1
RUN mkdir -p /root/.config/nixpkgs && \
    echo '{ allowUnfree = true; }' > /root/.config/nixpkgs/config.nix

RUN nix profile add --impure \
    nixpkgs#claude-code \
    nixpkgs#fish \
    nixpkgs#ripgrep \
    nixpkgs#nodejs \
    nixpkgs#pnpm \
    nixpkgs#python3 \
    nixpkgs#uv

WORKDIR /workspace

ENV DO_NOT_TRACK=1
ENV CLAUDE_CODE_DISABLE_NONESSENTIAL_TRAFFIC=1
ENV CLAUDE_CONFIG_DIR=/root/.claude

ENTRYPOINT ["claude"]
