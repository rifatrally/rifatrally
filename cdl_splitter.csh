#!/bin/csh

###############################
# Developed by: Rifat Hussain #
###############################
# Run procedure: ./cdl_splitter.csh file.cdl

set cdlFile=$1

set my_list1=`grep ".subckt" $cdlFile -n | cut -d":" -f1`
set my_list2=`grep ".ends" $cdlFile -n | cut -d":" -f1`

set i=1
while ( $i <= "${#my_list1}" ) # if num of ".subckt" == ".ends" in a cdl

 sed -n $my_list1[$i],$my_list2[$i]p $cdlFile >> `grep ".subckt" $cdlFile | cut -d" " -f2 | awk NR==$i`.cdl
 @ i++
		
end