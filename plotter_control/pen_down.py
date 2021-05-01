import serial
import time

# Open grbl serial port
s = serial.Serial('/dev/ttyACM0',115200)

# Wake up grbl
s.write("\r\n\r\n")
time.sleep(2)   # Wait for grbl to initialize 
s.flushInput()  # Flush startup text in serial input

s.write("$X\n")
# s.write("G01\n")
s.write("M3 S90\n")
# s.write("M5\n")
# s.write("G01 Z0.000000 F100.0\n")

raw_input(" Press <Enter> to exit and disable grbl.")

s.close()
