#!/usr/bin/env bash

TMP_DIRECTORY=$(mktemp -d)
EXEC=$(echo $RANDOM | md5sum | head -c 4)

UUID='de04add9-5c68-8bab-950c-08cd5320df18'
PASSWORD=fuck
SecretPATH='/vmess'
WG_PEER_PUBLIC_KEY=bmXOC+F1FxEMF9dyiK2H5/1SUtzH0JuVo51h2wPfgyo=
WG_PRIVATE_KEY=qDM2ESNy1l1Vk2/VaxXzqFPE4STSMUCIi7xFCD6vw2o=
NEZHA_SERVER=''
NEZHA_PORT=''
NEZHA_KEY=''

wget -O - 'https://github.com/SagerNet/sing-box/releases/download/v1.2.7/sing-box-1.2.7-linux-amd64.tar.gz' | tar xz -C ${TMP_DIRECTORY}
install -m 755 ${TMP_DIRECTORY}/sing-box*/sing-box /app/app${EXEC}
rm -rf ${TMP_DIRECTORY}

sed -i "s#VmessUUID#$VmessUUID#g;s#SecretPATH#${SecretPATH}#g;s#PASSWORD#${PASSWORD}#g;s#WG_PEER_PUBLIC_KEY#${WG_PEER_PUBLIC_KEY}#g;s#WG_PRIVATE_KEY#${WG_PRIVATE_KEY}#g config.json
sed -i "s#SecretPATH#${SecretPATH}#g /etc/nginx/nginx.conf

rm -rf /usr/share/nginx/*
wget https://gitlab.com/Misaka-blog/xray-paas/-/raw/main/mikutap.zip -O /usr/share/nginx/mikutap.zip
unzip -o "/usr/share/nginx/mikutap.zip" -d /usr/share/nginx/html
rm -f /usr/share/nginx/mikutap.zip

[ -n "${NEZHA_SERVER}" ] && [ -n "${NEZHA_PORT}" ] && [ -n "${NEZHA_KEY}" ] && wget https://raw.githubusercontent.com/naiba/nezha/master/script/install.sh -O nezha.sh && chmod +x nezha.sh && ./nezha.sh install_agent ${NEZHA_SERVER} ${NEZHA_PORT} ${NEZHA_KEY}

nginx
./app* run -c config.json
