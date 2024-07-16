FROM ubuntu:jammy

# Install dependencies, compile tools and libbfd, clang-bpf-co-re, llvm, libcap
RUN apt update && \
    apt install -y wget unzip cmake build-essential libelf-dev pkg-config && \
    apt install -y binutils-dev clang llvm libcap-dev

# libbpfv0.5.0 + bpftoolv5.10
RUN wget -O libbpf.zip https://github.com/libbpf/libbpf/archive/refs/tags/v0.5.0.zip && \
    wget -O libbpf-bootstrap.zip https://github.com/libbpf/libbpf-bootstrap/archive/refs/heads/master.zip && \
    wget -O bpftool.deb http://ftp.cn.debian.org/debian/pool/main/l/linux/bpftool_5.10.218-1_$(dpkg --print-architecture).deb && \
    dpkg -i bpftool.deb

RUN unzip libbpf.zip && \
    unzip libbpf-bootstrap.zip && \
    mv libbpf-0* libbpf && \
    mv libbpf-bootstrap-* libbpf-bootstrap && \
    mv libbpf libbpf-bootstrap/ && \
    rm *.zip && \
    rm bpftool.deb

WORKDIR /libbpf-bootstrap/examples/code/
