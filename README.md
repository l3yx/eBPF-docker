Docker container for compiling static eBPF applications with [libbpf-bootstrap](https://github.com/libbpf/libbpf-bootstrap).

Usage:

1. Put code files in directory `/code/libbpf-bootstrap` , such as `helloworld.bpf.c` and `helloworld.c`
2. Modify the environment variable `PROGRAM_NAME` in the `docker-compose.yml` file, such as `helloworld`
3. Run command: `docker compose up`, the program will be automatically compiled and run

