#include <linux/bpf.h>
#include <bpf/bpf_helpers.h>

char LICENSE[] SEC("license") = "Dual BSD/GPL";

SEC("raw_tracepoint/sys_exit")
int handle_tp(void *ctx)
{
	bpf_printk("Hello World!");
	return 0;
}
