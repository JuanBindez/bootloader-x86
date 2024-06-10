# bootloader

bootloader in assembly

## compile
    nasm -f bin -o bootloader.bin bootloader.asm

## create image
    dd if=/dev/zero of=bootloader.img bs=512 count=1
    dd if=bootloader.bin of=bootloader.img conv=notrunc

## rum in qemu
    qemu-system-x86_64 -drive format=raw,file=bootloader.img


