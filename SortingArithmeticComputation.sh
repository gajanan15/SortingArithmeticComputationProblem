#!/bin/bash -x

read -p "Enter Value Of A: " a
read -p "Enter Value Of B: " b
read -p "Enter Value Of C: " c

result1=`echo "scale=2; $a+$b*$c" | bc`
result2=`echo "scale=2; $a*$b+$c" | bc`
result3=`echo "scale=2; $c+$a/$b" | bc`
result4=`echo "scale=2; $(($a%$b))+$c" | bc`
