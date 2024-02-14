#!/bin/bash

source ./function/fun.sh

title="MENU"
item=( "Exit" "Function-1" "Function-2" "Function-3" "test menu")
func=( EXIT fun1 fun2 fun3 menu-test)

item_test=( "BACK" "Function-1" "Function-2" )
func_test=( BACK fun1 fun2 menu-test)

idx=1
menu-test(){
    title="Menu-$idx"
    idx=$((idx+1));
    item_test[3]="Menu-$idx"
    init_menu $title "${#item_test[@]}" "${item_test[@]}" "${func_test[@]}" $desc
    idx=$((idx-1));
}

main-menu(){
    init_menu $title "${#item[@]}" "${item[@]}" "${func[@]}" $desc
}

main(){
    main-menu
}

main