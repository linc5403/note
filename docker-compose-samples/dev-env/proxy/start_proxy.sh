#!/bin/bash

sslocal -c /proxy/shadowsocks.json &
ssh -4f -L *:3307:public_host:public_port -N hunch@ssh_remote_host
polipo -c /proxy/polipo.conf
