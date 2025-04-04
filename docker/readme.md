# Docker Usage Guide

This README provides instructions for building, tagging, and pushing the LaTeX environment container.

## Building the Container

Build the Docker image locally:

```bash
docker build -t fedora_texlive_cmake_mermaid .
```

## Publishing to GitHub Container Registry

Login to GitHub Container Registry:

```bash
docker login ghcr.io -u geugenm
```

Tag the local image for the registry:

```bash
docker tag fedora_texlive_cmake_mermaid ghcr.io/geugenm/diploma:latest
```

Push the image to the registry:

```bash
docker push ghcr.io/geugenm/diploma:latest
```

## Using the Container

Pull the container from GitHub Container Registry:

```bash
docker pull ghcr.io/geugenm/diploma:latest
```

Run the container:

```bash
docker run -it --rm -v $(pwd):/workspace ghcr.io/geugenm/diploma:latest
```
