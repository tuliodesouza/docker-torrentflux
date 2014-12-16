#!/bin/bash

/etc/init.d/mysql start
apache2ctl -D FOREGROUND