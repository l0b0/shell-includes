#!/bin/sh
# NAME
#        verbose_print.sh - Function to print messages in verbose mode
#
# SYNOPSIS
#        . verbose_print.sh
#        verbose_print MESSAGE...
#
# DESCRIPTION
#        Prints messages to standard output if $verbose is set. Messages are
#        not separated by any characters. To print newline-separated messages,
#        see verbose_print_line.sh.
#
# BUGS
#        https://github.com/l0b0/shell-includes/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2013 Victor Engmark
#
#        This program is free software: you can redistribute it and/or modify it
#        under the terms of the GNU General Public License as published by the
#        Free Software Foundation, either version 3 of the License, or (at your
#        option) any later version.
#
#        This program is distributed in the hope that it will be useful, but
#        WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
#        General Public License for more details.
#
#        You should have received a copy of the GNU General Public License along
#        with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

verbose_print() {
    if [ -n "${verbose+defined}" ]
    then
        printf '%s' "$@"
    fi
}
