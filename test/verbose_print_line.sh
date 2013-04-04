#!/bin/sh
directory="$(dirname -- "$0")"
. "$directory"/../verbose_print_line.sh
verbose=
verbose_print_line 'message'
