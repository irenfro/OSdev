#!/bin/bash

cd ~/OSdev/
make
qemu-system-i386 -cdrom myos.iso
