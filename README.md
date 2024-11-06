# Package in docker r2 + r2ghidra + r2retdec

## Install

```
docker build . -t r2-docker-ghidra
```

## Run

```
docker run -it -rm -v $(PWD):/home/nonroot/workdir r2-docker-ghidra
```
