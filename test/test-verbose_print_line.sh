#!/usr/bin/env bash
#
# NAME
#        test-verbose_print_line.sh - Test script for verbose_print_line
#        function
#
# SYNOPSIS
#        ./test-verbose_print_line.sh
#
# BUGS
#        https://github.com/l0b0/shell-includes/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2012-2013 Victor Engmark
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
declare -r directory="$(dirname -- "$0")"

oneTimeSetUp() {
    stdout="$__shunit_tmpDir"/stdout
    stderr="$__shunit_tmpDir"/stderr
}

test_no_verbose() {
    "$directory"/no_verbose_print_line.sh > "$stdout" 2> "$stderr"
    assertEquals 'Wrong exit code' 0 $?
    assertFalse "Output on standard output: $(cat "$stdout")" '[ -s "$stdout" ]'
    assertFalse "Output on standard error: $(cat "$stderr")" '[ -s "$stderr" ]'
}

test_verbose() {
    "$directory"/verbose_print_line.sh > "$stdout" 2> "$stderr"
    assertEquals 'Wrong exit code' 0 $?
    assertTrue 'No output on standard output' '[ -s "$stdout" ]'
    assertFalse "Output on standard error: $(cat "$stderr")" '[ -s "$stderr" ]'
    assertEquals 'Wrong output' $'message\nx' "$(cat "$stdout"; printf x)"
}

# load and run shUnit2
test -n "${ZSH_VERSION:-}" && SHUNIT_PARENT=$0
. /usr/share/shunit2/shunit2
