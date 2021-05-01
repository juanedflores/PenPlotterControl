#! /bin/bash

clear ;

echo " "
echo "|--------------------------------------------------------------|"
echo "|                   Universal CNC Controller                   |"
echo "|--------------------------------------------------------------|"
echo "|                         Manual Mode                          |"
echo "|--------------------------------------------------------------|"
echo "|                       s = Stream File                        |"
echo "|--------------------------------------------------------------|"
echo " "
echo "Enter A G-Code Command: " ;
read COMMAND ;
dir="./plotter_control/"

if
[ "$COMMAND" == "s" ] ;
then bash ${dir}stream.sh 
fi

echo $COMMAND > ${dir}gcode.ngc ;

python ${dir}stream.py ${dir}gcode.ngc $(cat ${dir}device) ;

bash ${dir}manual.sh ;
