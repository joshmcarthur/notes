#!/bin/bash

locale-gen en_NZ.UTF-8
update-locale LANG=en_NZ.UTF-8
apt-get update
apt-get install yasm nasm gdb gdb-doc tree --assume-yes
apt-get autoremove --assume-yes
