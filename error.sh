# NAME
#        error.sh - Function to print an error message and exit
#
# SYNOPSIS
#        . error.sh
#        error MESSAGE [EXIT_CODE]
#
# DESCRIPTION
#        Prints messages to standard error, then exits the sourcing script with
#        the given exit code (default 1).
#
# BUGS
#        https://github.com/l0b0/shell-includes/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2010-2012 Victor Engmark
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

. "`dirname -- "$0"`"/warning.sh

error() {
    messages=( "$@" )

    # If the last parameter is a number, it's not part of the messages
    last_parameter="${messages[@]: -1}"
    case "$last_parameter" in
        ''|*[!0-9]*)
            ;;
        *)
            exit_code=$last_parameter
            unset messages[$((${#messages[@]} - 1))]
            ;;
    esac

    echo -n "`basename -- "$0"`: " >&2
    warning "${messages[@]}"

    exit ${exit_code-1}
}
