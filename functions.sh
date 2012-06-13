# NAME
#    functions.sh - Utility functions for shell scripts
#
# SYNOPSIS
#    . functions.sh
#
# BUGS
#    https://github.com/l0b0/tilde/issues
#
# COPYRIGHT AND LICENSE
#    Copyright (C) 2010-2012 Victor Engmark
#
#    This program is free software: you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation, either version 3 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

warning() {
    # Output warning messages
    # Color the output red if it's an interactive terminal
    # @param $1...: Messages

    test -t 1 && tput setf 4

    printf '%s\n' "$@" >&2

    test -t 1 && tput sgr0 # Reset terminal
    true
}

verbose_echo() {
    # @param $1: Optionally '-n' for echo to output without newline
    # @param $(1|2)...: Messages
    if [ "${verbose-}" ]
    then
        if [ "${1-}" = "-n" ]
        then
            local -r newline='-n'
            shift
        fi

        while [ "${1+defined}" = defined ]
        do
            echo -e ${newline-} "$1" >&2
            shift
        done
    fi
    true
}
