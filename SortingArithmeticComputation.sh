#!/bin/bash -x
declare -A resultComputation

read -p "Enter Value Of A: " a
read -p "Enter Value Of B: " b
read -p "Enter Value Of C: " c

count=0

result1=`echo "$a+$b*$c" | bc`
result2=`echo "$a*$b+$c" | bc`
result3=`echo "scale=2; $c+$a/$b" | bc`
result4=`echo "$a%$b+$c" | bc`

resultComputation[result1]=$result1
resultComputation[result2]=$result2
resultComputation[result3]=$result3
resultComputation[result4]=$result4

while [[ $count -ne ${#resultComputation[@]} ]]
do
	array[$count]=${resultComputation[result"$(( count+1 ))"]}
	count=$(( count+1 ))
done
echo ${array[@]}

for((i=0;i<3;i++))
do
	for((j=i+1;j<4;j++))
	do
		if [[ ${array[i]%.*} -lt ${array[j]%.*} ]]
		then
			temp=${array[i]}
			array[i]=${array[j]}
			array[j]=$temp
		fi
	done
done
echo Descending order : ${array[@]}

for((i=0;i<3;i++))
do
	for((j=i+1;j<4;j++))
	do
		if [[ ${array[i]%.*} -gt ${array[j]%.*} ]]
		then
			temp=${array[i]}
			array[i]=${array[j]}
			array[j]=$temp
		fi
	done
done
echo Ascending order : ${array[@]}
