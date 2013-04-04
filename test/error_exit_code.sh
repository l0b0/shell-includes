#!/bin/sh
directory="$(dirname -- "$0")"
. "$directory"/../error.sh
error 'message' 255
