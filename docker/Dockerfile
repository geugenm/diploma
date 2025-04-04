FROM registry.fedoraproject.org/fedora-minimal:latest

RUN microdnf update -y && \
    microdnf install -y \
    texlive-scheme-full \
    cmake \
    ninja-build \
    nodejs \
    gcc \
    gcc-c++ \
    npm && \
    microdnf clean all

RUN npm install -g @mermaid-js/mermaid-cli && \
    mmdc --version

# Set default command (optional)
CMD ["/bin/bash"]
