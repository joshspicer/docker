#!/bin/sh

if [ -z "$KEY" ]; then 
    KEY="shouldprobsSETSOMETHING3lse"
fi

GPG_TTY=$(tty) \
&& export GPG_TTY \
&& cd /tmp \
&& gpg --symmetric --batch --yes --passphrase $KEY VSFeedbackVSRTCLogs.zip \
&& curl --upload-file VSFeedbackVSRTCLogs.zip.gpg https://free.keep.sh
