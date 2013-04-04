#!/bin/sh
directory="$(dirname -- "$0")"
. "$directory"/../verbose_print.sh
verbose=
verbose_print 'message'
