#!/bin/bash

SSLMARIAIP=$(docker inspect -f '{{ .NetworkSettings.IPAddress }}' sslmaria)

docker run -it --rm -w /home -v $PWD:/home --name mariaclient --link sslmaria:mysql mariadb \
mysql -h"$SSLMARIAIP" -P3306 -uiamsecure -piamsecurepwd \
--ssl-ca=/home/ca-cert-1/ca-cert-1.pem --ssl-cert=/home/client-cert-1/client-cert-1.pem \
--ssl-key=/home/client-private-1/client-private-key-rsa-1.pem
