#!/bin/bash -x

read -p "Enter Value Of A: " a
read -p "Enter Value Of B: " b
read -p "Enter Value Of C: " c

result1=`echo "scale=2; $a+$b*$c" | bc`
