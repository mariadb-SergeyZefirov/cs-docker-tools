#!/bin/sh

#gdb /usr/bin/ExeMgr --tui -p $(pidof ExeMgr)
gdb /usr/bin/ExeMgr -p $(pidof ExeMgr)
