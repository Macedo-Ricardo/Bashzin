#!/bin/bash
if [ "$1" == "" ]
then
echo -e "\033[01;31m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\033[0m"
echo -e "\033[01;31m#             BEM VINDO AO PARSING HTML                 #\033[0m"
echo -e "\033[01;34m#           MODE DE USO: $0 + SITE            #\033[0m"
echo -e "\033[01;34m#        EXEMPLO:\033[01;32m./parsing.sh www.site.com.br           #\033[0m>
echo -e "\033[01;31m%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%\033[0m"

else
alvo='$1'
curl -s "$1" | grep "http:" | cut -d '"' -f 2 | grep '//' | cut -d '/' -f 3 > lista;
echo -e
echo -e "\033[01;33m############################################\033[0m"
echo -e "\033[01;33m|->            BUSCANDO HOSTS. .. ...    <-|\033[0m"
echo -e "\033[01;33m############################################\033[0m"
cat lista
echo -e
echo -e "\033[01;33m###########################################\033[0m"
echo -e "\033[01;33m|          RESOLVENDO URL AND  IP... .. . |\033[0m"
echo -e "\033[01;33m###########################################\033[0m"
for url in $(cat lista);do HOSTS=$(host $url | grep -v "NXDOMAIN" | grep "$url")

echo "$HOSTS"

done
fi
