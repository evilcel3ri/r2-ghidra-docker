# Use an official base image that includes necessary tools
FROM ubuntu:20.04

# Avoid prompts from apt and install dependencies
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get install -y \
    autoconf  \
    automake \
    build-essential \
    cmake \
    curl \
    g++ \
    git \
    libtool \
    make \
    pkg-config \
    unzip \
    && rm -rf /var/lib/apt/lists/*


# Clone Radare2 repository
RUN git clone https://github.com/radareorg/radare2

# Run the install script
RUN cd radare2/sys && ./install.sh
RUN r2pm -U
RUN r2pm -ci r2ghidra
RUN r2pm -ci r2ghidra-sleigh

# Set the working directory
RUN mkdir -p /home/nonroot/workdir
WORKDIR /home/nonroot/workdir

#r2pm -r r2ai
# pip install transformers -U

# This command keeps the container running. Replace it with the command to run your tool if needed.
CMD ["/bin/bash"]
