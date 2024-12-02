#!/bin/bash
ubuntu2404_mysql() {
    [ ! -e /usr/lib/x86_64-linux-gnu/libaio.so.1 ] && ln -s /usr/lib/x86_64-linux-gnu/libaio.so.1t64.0.2 /usr/lib/x86_64-linux-gnu/libaio.so.1
    [ ! -e /usr/lib/x86_64-linux-gnu/libtinfo.so.5 ] && ln -s /usr/lib/x86_64-linux-gnu/libtinfo.so.6.4 /usr/lib/x86_64-linux-gnu/libtinfo.so.5
}