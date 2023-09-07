#!/bin/bash
openssl pkeyutl -encrypt -pubin -inkey /home/al/certificate/public.pem -in /home/al/certificate/sec.txt -out /home/al>
openssl pkeyutl -decrypt -inkey /home/al/certificate/private.pem -in /home/al/certificate/sec1.txt -out /home/al/cert>
