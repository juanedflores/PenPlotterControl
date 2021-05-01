import serial
import time

# Open grbl serial port
s = serial.Serial('/dev/ttyACM0',115200)

# Wake up grbl
s.write("\r\n\r\n")
time.sleep(2)   # Wait for grbl to initialize 
s.flushInput()  # Flush startup text in serial input

s.write("$H\n")
s.write("g92 x0 y0\n")

raw_input(" Press <Enter> to exit and disable grbl.")

s.close()
