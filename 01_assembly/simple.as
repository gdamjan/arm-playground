.cpu cortex-m3
.thumb
.section    isr_vector
    .word       0
    .word       _start + 1
    .word       _nmi_handler + 1
    .word       _hard_fault + 1
    .word       _memory_fault + 1
    .word       _bus_fault + 1
    .word       _usage_fault + 1
    .text
    .global _start

_start:
    mov r2, #3
    mov r3, #4
    add r4, r2, r3

stop:
    b stop

_dummy:
_nmi_handler:
_hard_fault:
_memory_fault:
_bus_fault:
_usage_fault:
    add r0, #1
    add r1, #1
    b _dummy
