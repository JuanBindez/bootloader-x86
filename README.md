# bootloader

bootloader in assembly x86

## compile
    nasm -f bin -o bootloader.bin bootloader.asm

## create image
    dd if=/dev/zero of=bootloader.img bs=512 count=1
    dd if=bootloader.bin of=bootloader.img conv=notrunc

## install qemu
     sudo apt install qemu-system-x86

## rum in qemu
    qemu-system-x86_64 -drive format=raw,file=bootloader.img


