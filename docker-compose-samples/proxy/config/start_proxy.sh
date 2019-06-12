#!/bin/bash

sslocal -c /config/shadowsocks.json &
polipo -c /config/polipo.conf
