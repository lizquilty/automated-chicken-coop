gpio -g mode 18 pwm
gpio pwm-ms
gpio pwmc 192
gpio pwmr 2000
gpio -g pwm 18 100
sleep 2
gpio -g pwm 18 150
