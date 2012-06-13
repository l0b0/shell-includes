# NAME
#        error.sh - Function to print an error message and exit
#
# SYNOPSIS
#        . error.sh
#        error MESSAGE [EXIT_CODE]
#
# DESCRIPTION
#        Prints a message to standard error, then exits the sourcing script with
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

error() {
    echo "`basename -- "$0"`: $1" >&2
    exit ${2-1}
}