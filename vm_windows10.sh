#!/usr/bin/env sh

qemu-system-x86_64 -name win10,process=win10 -daemonize \
        -machine type=q35,accel=kvm,vmport=off \
        -cpu host,+hypervisor,+invtsc,l3-cache=on,migratable=no,topoext \
        -smp cores=4,threads=2,sockets=1 \
        -m 8G \
        -vga qxl -device virtio-serial-pci \
        -spice port=5900,disable-ticketing=on \
        -device virtserialport,chardev=spicechannel0,name=com.redhat.spice.0 \
        -chardev spicevmc,id=spicechannel0,name=vdagent \
        -drive file=win.img,if=virtio \
        -netdev user,id=net0 -device e1000,netdev=net0 \
        -usbdevice tablet

exec remote-viewer spice://localhost:5900
