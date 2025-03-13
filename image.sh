#!/bin/bash

dd if=/dev/zero of=disk.img bs=512 count=2880
dd if=bootloader.bin of=disk.img conv=notrunc