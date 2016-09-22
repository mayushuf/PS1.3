#!/bin/bash

#Solution for problem set 1.3
# Yushuf Sharker
# 09/22/2016

##### Algorithm #####################

# Create a blank text file with year and Maxtemp header
# for each year get access to the folder and from each daily files get the max temp
# print thme in the blank text file
# Create another blank txt file for yearly maximum temperature
# Use the dely maxtemp.txt for each year find the yearly maximum temp of august and take 
# the output in maxtemp_Yearly.txt
# From Maxtemp_Yearly.txt get the years with max and min temperature


echo "Takes couple of minute to get solution for the first part"
echo "Please wait ..."
rm -f /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt
echo "Year" "Maxtemp" >>  /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt

for year in {1973..2016}
do

 	cd /ufrc/zoo6927/share/yushuf/PS1.3/data/$year
	x=`ls`
  	for files in $x 
	do
		echo "$year" "`cat $files | grep -E "\w+M\," | awk '{print $2}'| awk -F',' '{print $2}' | sort -nr | \
		head -n1`"| awk '{print $1, $2}' >> /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt
	done

done
echo "daily temperature file created in maxtemp.txt" 
echo "First and last five observations are as follows"

cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt | head -n6
cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt | tail -n5

read -p "Press any key to continue for the second part solution" 

rm -f /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt
echo "Year" "Maxtemp" >>  /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt


for year in {1973..2016}
do
	echo "$year" "`grep -Po "(?=$year).*"  /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp.txt |
        awk '{print $2}'| sort | tail -n1`" >> /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt

done

echo "Yearly temperature file created named maxtemp_Yearly.txt"
echo "First and last five observations and last five observations"

cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt | head -n6
cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt | tail -n5

read -p "Press any key to continue for the solution for final part"
echo "Five years with highest temperature"
cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt | sort -r -k2 -k1| head -n6

echo "Five years with lowest temperature"
cat /ufrc/zoo6927/share/yushuf/PS1.3/maxtemp_Yearly.txt | sort -k2 -k1| head -n5

##########################################################################################################
