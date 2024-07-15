# ubuntu:jammy
FROM lscr.io/linuxserver/code-server:4.91.0

# Install dependencies, compile tools and libbfd, clang-bpf-co-re, llvm, libcap
RUN apt update && \
    apt install -y wget unzip cmake build-essential libelf-dev pkg-config && \
    apt install -y binutils-dev clang llvm libcap-dev

RUN wget -O libbpf.zip https://github.com/libbpf/libbpf/archive/refs/tags/v1.4.5.zip && \
    wget -O bpftool.zip https://github.com/libbpf/bpftool/archive/refs/tags/v7.4.0.zip && \
    wget -O libbpf-bootstrap.zip https://github.com/libbpf/libbpf-bootstrap/archive/refs/heads/master.zip

RUN unzip libbpf.zip && \
    unzip bpftool.zip && \
    unzip libbpf-bootstrap.zip && \
    mv libbpf-1* libbpf && \
    mv bpftool-* bpftool && \
    mv libbpf-bootstrap-* libbpf-bootstrap && \
    cp -r libbpf bpftool/ && \
    mv libbpf libbpf-bootstrap/ && \
    mv bpftool libbpf-bootstrap/ && \
    rm *.zip

WORKDIR /libbpf-bootstrap/examples/code/build
