#!/bin/sh

#gdb /usr/local/mariadb/columnstore/bin/controllernode --tui -p $(pgrep -f /usr/local/mariadb/columnstore/bin/controllernode)
gdb /usr/bin/controllernode --tui -p $(pgrep -f /usr/bin/controllernode)
