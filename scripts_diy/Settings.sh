#!/bin/bash

#移除luci-app-attendedsysupgrade
sed -i "/attendedsysupgrade/d" $(find ./feeds/luci/collections/ -type f -name "Makefile")

CFG_FILE="./package/base-files/files/bin/config_generate"
IP="192.168.4.1"
#修改默认IP地址
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$IP/g" $CFG_FILE
#修改immortalwrt.lan关联IP
sed -i "s/192\.168\.[0-9]*\.[0-9]*/$IP/g" $(find ./feeds/luci/modules/luci-mod-system/ -type f -name "flash.js")
#修改默认主机名
sed -i "s/hostname='.*'/hostname='OWRT'/g" $CFG_FILE

#配置文件修改
WRT_THEME="argon"
#修改默认主题
sed -i "s/luci-theme-bootstrap/$WRT_THEME/g" $(find ./feeds/luci/collections/ -type f -name "Makefile")
echo "CONFIG_PACKAGE_luci=y" >> ./.config
echo "CONFIG_LUCI_LANG_zh_Hans=y" >> ./.config
echo "CONFIG_PACKAGE_luci-theme-$WRT_THEME=y" >> ./.config
echo "CONFIG_PACKAGE_luci-app-$WRT_THEME-config=y" >> ./.config
