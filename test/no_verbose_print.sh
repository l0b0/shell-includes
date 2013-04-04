#!/bin/sh
directory="$(dirname -- "$0")"
. "$directory"/../verbose_print.sh
verbose_print 'message'
