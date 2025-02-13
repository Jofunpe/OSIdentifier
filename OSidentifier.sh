#!/bin/bash

# Colores

blackcolour="\e[30m"
redcolour="\e[31m"
greencolour="\e[32m"
endcolour="\e[0m"
yellowcolour="\e[33m"
bluecolour="\e[34m"
pinkcolour="\e[35m"
ciancolour="\e[36m"
whitecolour="\033[1;37m"
graycolour="\e[90m"
purplecolour="\e[1;35m"

# ctrl+c

function ctrl_c(){
echo -e "\n\n${redcolour}[!]${endcolour} ${yellowcolour}Saliendo...${endcolour}\n\n"
tput cnorm && exit 1
}
trap ctrl_c INT

# Help
if [ "$1" == -h ] ||  [ "$1" == --help ] || [ ! "$1" ]; then 
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} -- Como funciona el script --${endcolour}\n"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} El script le hace un ping a la IP proporcionada y extrae el TTL${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} EL TTL (time to live) es un valor en las respuestas ICMP que indica cuántos saltos puede hacer un paquete antes de ser descartado${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} Normalmente el TTL varía segun el SO que uses ${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} Este script no acierta el 100% de las veces (aunque sí en muchas), ya que el TTL se puede cambiar${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} Este script solo detecta sistemas Linux y Windows${endcolour}"
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} -- Como usarlo --${endcolour}\n"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} Para usarlo, simplemente ejecuta el script seguido de la IP víctima.${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour} Para acceder al panel de ayuda, ejecuta el script con el parametro -h | --help | o sin parametros${endcolour}"
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} -- TTLs comunes para algunos sistemas --${endcolour}\n"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}Linux/Unix: ${endcolour}${bluecolour}64${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}Windows: ${endcolour}${bluecolour}128${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}macOS: ${endcolour}${bluecolour}64${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}Solaris:${endcolour}${bluecolour}255${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}freeBSD: ${endcolour}${bluecolour}64${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}Android: ${endcolour}${bluecolour}64${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}iOS: ${endcolour}${bluecolour}64${endcolour}"
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} -- Autor --${endcolour}\n"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}Script desarrollado por Jofunpe${endcolour}"
    echo -e "\t${redcolour}->${endcolour} ${greencolour}https://jofunpe.com${endcolour}\n"
    exit 0
fi
# Script 

OS=$(ping -c 1 $1 2>/dev/null | head -n 2 | tail -n 1 | awk '{print $6}' | cut -d '=' -f2)
# echo "$OS" 

if [ -z "$OS" ] || [[ "$OS" =~ [a-zA-Z] ]]; then 
    echo -e "\n${redcolour}[!] ${endcolour}${greencolour}Hubo un error, es posible que la máquina víctima no acepte paquetes ICMP o que esté apagada.${endcolour}\n"
    exit 1
fi

# echo "$OS"

if [ "$OS" -ge 0 ] && [ "$OS" -le 64 ]; then  
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} Te encuentras ante una máquina: ${endcolour}${bluecolour}Linux${endcolour}"
    echo -e "${redcolour}[+]${endcolour}${greencolour} TTL: ${endcolour}${bluecolour}${OS}${endcolour}\n"
elif [ "$OS" -ge 65 ] && [ "$OS" -le 128 ]; then 
    echo -e "\n${redcolour}[+]${endcolour}${greencolour} Te encuentras ante una máquina: ${endcolour}${bluecolour}Windows${endcolour}"
    echo -e "${redcolour}[+]${endcolour}${greencolour} TTL: ${endcolour}${bluecolour}${OS}${endcolour}\n"
else
    echo -e "\n${redcolour}[!]${endcolour}${greencolour} No encontrado${endcolour}"
    echo -e "${redcolour}[+]${endcolour}${greencolour} TTL: ${endcolour}${bluecolour}${OS}${endcolour}\n"
fi