bash build_all.sh
qemu-system-riscv64 -machine virt -bios none -kernel build/kernel/kernel.elf -nographic