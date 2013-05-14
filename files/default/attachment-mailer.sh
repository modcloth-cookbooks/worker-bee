#!/bin/bash

# Define path to binaries used by this script
PATH="/opt/local/bin:/opt/local/sbin:/usr/bin:/usr/sbin"

# Define some variables used by this script
FILE="$1"
TO="$2"
FROM="$3"

if [ "${FILE}" = "" ]; then
  echo "Usage: $0 Filename To-Address From-Address"
  exit 1
fi

if [ "${TO}" = "" ]; then
  echo "Usage: $0 Filename To-Address From-Address"
  exit 1
fi

if [ "${FROM}" = "" ]; then
  echo "Usage: $0 Filename To-Address From-Address"
  exit 1
fi

if [ ! -f $FILE ]; then
  echo "File does not exist!"
  echo $1
fi

DATE=`date +%A", "%b" "%e" "%Y" "%H":"%M":"%S" "%z`
SUBJECT="$FILE - $DATE"
HASH=`echo ${DATE} | md5sum | awk '{print $1}'`
SHORT_HASH=`echo ${HASH} | cut -c1-12`

# Base64 encode the attachment
cat $FILE | base64 > /tmp/$FILE.b64

# Create the email file
touch /tmp/$FILE.email

# Build the header portion of the email... line by line"
echo "From: $FROM" >> /tmp/$FILE.email
echo "To: $TO" >> /tmp/$FILE.email
echo "Date: $DATE" >> /tmp/$FILE.email
echo "Subject: $SUBJECT" >> /tmp/$FILE.email
echo "Mime-Version: 1.0" >> /tmp/$FILE.email
echo "Content-Type: multipart/mixed; boundary=\"${HASH}\"" >> /tmp/$FILE.email
echo "Return-Receipt-To: $FROM" >> /tmp/$FILE.email
echo " " >> /tmp/$FILE.email
echo "--${HASH}" >> /tmp/$FILE.email
echo "Content-type: text/plain; charset=US-ASCII; name=\"$FILE\"" >> /tmp/$FILE.email
echo "Content-Disposition: attachment; filename=\"$FILE\"" >> /tmp/$FILE.email
echo "Content-Transfer-Encoding: base64" >> /tmp/$FILE.email
echo "X-Attachment-Id: ${SHORT_HASH}" >> /tmp/$FILE.email
echo " " >> /tmp/$FILE.email

# Attach the attachment
cat /tmp/$FILE.b64 >> /tmp/$FILE.email

# Build the footer portion of the email... line by line
echo "--${HASH}" >> /tmp/$FILE.email
echo " " >> /tmp/$FILE.email

# Send the email
cat /tmp/$FILE.email | sendmail -t

# Cleanup after ourselves
rm /tmp/$FILE.b64
rm /tmp/$FILE.email
