#!/bin/sh -ex
sudo rmmod binder_linux || true
sudo rmmod ashmem_linux || true
(cd modules/anbox/binder ; make clean && make -j4 ; sudo insmod binder_linux.ko; sudo chmod 666 /dev/binder)
(cd modules/anbox/ashmem ; make clean && make -j4 ; sudo insmod ashmem_linux.ko; sudo chmod 666 /dev/ashmem)
