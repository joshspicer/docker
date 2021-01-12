#!/bin/sh

if [ -z "$KEY" ]; then 
    read -sp 'Password: ' KEY
fi

LOGSDIR="/host/tmp/VSFeedbackVSRTCLogs"

# GPG_TTY=$(tty) \
# && export GPG_TTY \

zip $LOGSDIR.zip $LOGSDIR/* \
&& gpg --symmetric --batch --yes --passphrase $KEY $LOGSDIR.zip \
&& curl --upload-file $LOGSDIR.zip.gpg https://free.keep.sh
