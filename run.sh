#!/bin/bash

cd ~/OSdev/
make
qemu-system-i386 -cdrom myos.iso
# For running the bin file instead of the iso use the follwoing command
# qemu-system-i386 -kernel myos.bin
