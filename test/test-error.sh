#!/usr/bin/env bash
#
# NAME
#        test-error.sh - Test script for error function
#
# SYNOPSIS
#        ./test-error.sh
#
# BUGS
#        https://github.com/l0b0/shell-includes/issues
#
# COPYRIGHT AND LICENSE
#        Copyright (C) 2012 Victor Engmark
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

test_message() {
    "$directory"/error_message.sh > "$stdout" 2> "$stderr"
    assertEquals 'Wrong exit code' 1 $?
    assertFalse "Output on standard output: $(cat "$stdout")" '[ -s "$stdout" ]'
    assertTrue 'No output on standard error' '[ -s "$stderr" ]'
}

test_exit_code() {
    "$directory"/error_exit_code.sh > "$stdout" 2> "$stderr"
    assertEquals 'Wrong exit code' 2 $?
    assertFalse "Output on standard output: $(cat "$stdout")" '[ -s "$stdout" ]'
    assertTrue 'No output on standard error' '[ -s "$stderr" ]'
}

# load and run shUnit2
test -n "${ZSH_VERSION:-}" && SHUNIT_PARENT=$0
. /usr/share/shunit2/shunit2
