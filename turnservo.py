#!/bin/python
# In case you want to use python and go the hard way about things - this is an example script to show you basics
#
# To make this work do the following
#
# apt-get install wiringpi
# pip install wiringpi
#
# Servo Control

import time
import wiringpi
 
# use 'GPIO naming'
wiringpi.wiringPiSetupGpio()
 
# set #18 to be a PWM output
wiringpi.pinMode(18, wiringpi.GPIO.PWM_OUTPUT)
 
# set the PWM mode to milliseconds stype
wiringpi.pwmSetMode(wiringpi.GPIO.PWM_MODE_MS)
 
# divide down clock
wiringpi.pwmSetClock(192)
wiringpi.pwmSetRange(2000)
 
delay_period = 0.01
 
while True:
        for pulse in range(50, 250, 1):
                wiringpi.pwmWrite(18, pulse)
                time.sleep(delay_period)
        for pulse in range(250, 50, -1):
                wiringpi.pwmWrite(18, pulse)
                time.sleep(delay_period)
