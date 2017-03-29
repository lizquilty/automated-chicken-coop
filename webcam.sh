#!/bin/bash

HOST=your-ftp-hostname.com
USER=chickens.ftp.user
PASS=bokbokbokpasswordbok

# Create a RAM disk to hold the picture, prior to uploading to FTP
mkdir -p /ram
mount -t tmpfs -o size=100m tmpfs /ram

cd /ram

# this makes it run forever
while true
do


#echo -e "Picture number $i\n=================="

# Take a picture
#/opt/vc/bin/raspistill -w 640 -h 480 -o image.jpg 
/opt/vc/bin/raspistill -w 864 -h 648 -o image.jpg 
cp image.jpg /var/www/html/bokbok.jpg



# Start the FTP client. -i to turn off interactive prompting. 
# -n prevents auto login. -v enables verbose output.
ftp -pin $HOST << EOF
user $USER $PASS
put image.jpg
rename image.jpg bokbok.jpg
bye
EOF

# Wait for a minute
sleep 2

done

# remove the RAM disk
umount /ram
rmdir /ram

