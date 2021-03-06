#!/bin/sh
#
# NAME
#        test.sh - Test shell scripts
#
# DESCRIPTION
#        Runs all the test scripts in this directory.
#
# BUGS
#        https://github.com/l0b0/shell-includes/issues
#
# COPYRIGHT
#        Copyright (C) 2012 Victor Engmark
#
#        This program is free software: you can redistribute it and/or modify
#        it under the terms of the GNU General Public License as published by
#        the Free Software Foundation, either version 3 of the License, or
#        (at your option) any later version.
#
#        This program is distributed in the hope that it will be useful,
#        but WITHOUT ANY WARRANTY; without even the implied warranty of
#        MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#        GNU General Public License for more details.
#
#        You should have received a copy of the GNU General Public License
#        along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
################################################################################

set -o errexit -o noclobber -o nounset

for path in "$(dirname -- "$0")"/test-*.sh
do
    printf '%s\n' "$path"
    set +o errexit
    "$path" || exit_code=$?
    set -o errexit
done
exit "${exit_code-0}"
