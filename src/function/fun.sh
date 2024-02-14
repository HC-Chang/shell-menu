#!/bin/bash

### basic function
EXIT() {
    echo -e "--- EXIT ---\n"
    exit
}

BACK() {
    w_loop="false"
    echo -e "--- BACK ---\n"
}

check_val() {
    val=$1
    select=-1
    while [ true ]; do
        read select
        if [[ -n "$select" && select -ge 0 && select -lt val ]]; then
            break
        fi
        echo "  Type Error !"
    done
}

# title
# count
# items
# functions
# description
init_menu() {
    clear

    # title
    local TITLE=$1
    shift

    # count
    local COUNT=$1
    shift

    # items
    local ITEMs=""
    for ((i = 0; i < COUNT; i = i + 1)); do
        ITEMs[$i]="$1"
        shift
    done

    # funcs
    local FUNCs=""
    for ((i = 0; i < COUNT; i = i + 1)); do
        FUNCs[$i]="$1"
        shift
    done

    # description
    local DESC=$1
    shift

    local w_loop=true
    while true; do
        clear
        printf "==================== %8s ====================\n" "  $TITLE  "

        for ((i = 0; i < COUNT; i = i + 1)); do
            echo "  $i:  ${ITEMs[i]}"
        done

        printf "=====================%8s=====================\n" "========"

        # functions
        echo -e "Please select (0~$((COUNT - 1))): "
        select=-1
        check_val $COUNT select
        
        ${FUNCs[select]}
        
        if [[ "$w_loop" == "false" ]]; then
            break
        fi

        echo "--------------------"
        echo "Press any key ..."
        read
    done
}

### test function
fun1() {
    printf "Fun 1\n"
}

fun2() {
    printf "Fun 2\n"
}

fun3() {
    printf "Fun 3\n"
}
