#!/bin/bash
set -e

function run_shell {
    /bin/bash
}

function run_test {
    exit 0
}

function main {
    local mode="$1" 
    [ -z "$mode" ] && exit 1

    if [ "$mode" = "shell" ] ; then
        run_shell
    elif [ "$mode" = "test" ] ; then
        run_test
    else
        echo "Unknown command '$mode'"
        exit 2
    fi
}

main $*
