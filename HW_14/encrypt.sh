#!/bin/bash
file2="/home/al/certificate/public.pem"
read -r x
encript=$(echo "$x" | openssl pkeyutl -encrypt -pubin -inkey "$file2" | base64)
echo "$encript"




