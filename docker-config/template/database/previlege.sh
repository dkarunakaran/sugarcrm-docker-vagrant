#!/bin/bash
sleep 5s
mysql -e "GRANT ALL ON *.* to 'root'@'%'; FLUSH PRIVILEGES;"
