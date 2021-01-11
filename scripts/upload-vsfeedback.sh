#!/bin/sh

if [ -z "$KEY" ]; then 
    KEY="shouldprobsSETSOMETHING3lse"
else
    read -sp 'Password: ' $KEY
fi

# GPG_TTY=$(tty) \
# && export GPG_TTY \

zip /tmp/VSFeedbackVSRTCLogs.zip /tmp/VSFeedbackVSRTCLogs \
&& gpg --symmetric --batch --yes --passphrase $KEY /tmp/VSFeedbackVSRTCLogs.zip \
&& curl --upload-file /tmp/VSFeedbackVSRTCLogs.zip.gpg https://free.keep.sh
