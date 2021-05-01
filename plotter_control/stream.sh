#! /bin/bash

clear ;

echo " "
echo "|--------------------------------------------------------------------------|"
echo "|                          Universal CNC Controller                        |"
echo "|--------------------------------------------------------------------------|"
echo "|                                Stream Mode                               |"
echo "|--------------------------------------------------------------------------|"
echo "|  h = Home  s = List Files   m = Manual Mode   u = Pen Up   d = Pen Down  |"
echo "|--------------------------------------------------------------------------|"
echo " "
echo "Enter the Absolute Path to Your G-Code File: " 
echo " "
read FILENAME ;
dir="./plotter_control/"

if
[ "$FILENAME" == "h" ] ;
then /usr/bin/python2 ${dir}home.py 
  bash ${dir}stream.sh
fi

if
[ "$FILENAME" == "s" ] ;
then  bash ${dir}show_files.sh
fi

if
[ "$FILENAME" == "m" ] ;
then bash ${dir}manual.sh 
fi

if
[ "$FILENAME" == "u" ] ;
then /usr/bin/python2 ${dir}pen_up.py 
  bash ${dir}stream.sh
fi

if
[ "$FILENAME" == "d" ] ;
then /usr/bin/python2 ${dir}pen_down.py 
  bash ${dir}stream.sh
fi


cat "/home/pi/penplotter/$FILENAME" > ${dir}gcode.ngc ; # Copies the user's file to gcode.ngc to be streamed by stream.py

python ${dir}stream.py ${dir}gcode.ngc $(cat ${dir}device) ;

bash ${dir}stream.sh ;
