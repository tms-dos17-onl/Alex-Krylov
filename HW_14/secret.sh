#!/bin/bash
key="/home/al/certificate/public.pem"
read -r x
echo "$x"|openssl pkeyutl -encrypt -pubin -inkey "$key"
