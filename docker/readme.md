```bash
docker build -t fedora_texlive_cmake_mermaid .
docker login ghcr.io -u geugenm
docker tag fedora_texlive_cmake_mermaid ghcr.io/geugenm/diploma:latest
docker push ghcr.io/geugenm/diploma:latest
```
