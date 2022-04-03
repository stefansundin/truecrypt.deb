#!/bin/bash -ex
docker run -v $PWD:/mnt stefansundin/ppastats ppastats stefansundin truecrypt -o /mnt
