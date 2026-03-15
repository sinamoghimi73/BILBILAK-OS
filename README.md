# BILBILAK-OS

## Setup
### Install QEMU

- macOS (Homebrew)

```sh
brew install qemu
```

- Ubuntu/Debian

```sh
sudo apt update
sudo apt install qemu-system-misc
```

- Verify

```sh
qemu-system-riscv64 --version
```


### Install RISC-V GNU Toolchain
- macOS (Homebrew)

```sh
brew tap riscv-software-src/riscv && brew install riscv-tools
```

- Ubuntu/Debian

```sh
sudo apt install gcc-riscv64-unknown-elf g++-riscv64-unknown-elf
```

- Verify

```sh
riscv64-unknown-elf-gcc --version
riscv64-unknown-elf-g++ --version
```



## Build
```sh
bash build_all.sh
```

## Build and Run
```sh
bash build_and_run.sh
```



## Notes
To terminate, simply press `CTRL+A X`
