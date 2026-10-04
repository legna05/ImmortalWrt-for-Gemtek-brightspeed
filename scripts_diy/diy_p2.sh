#!/bin/bash

# 获取脚本所在目录的上一级目录
PARENT_DIR="$(cd "$(dirname "$0")/.." && pwd)"
echo "PARENT_DIR=$PARENT_DIR"

feeds_path="$PARENT_DIR/scripts/feeds"

#优先安装 passwall 源
$feeds_path install -a -f -p passwall_packages
$feeds_path install -a -f -p passwall_luci
$feeds_path install -a -f -p openclash
$feeds_path install -a -f -p nikki
$feeds_path install -a -f -p gecoosac
$feeds_path install -a -f -p ddns_go
$feeds_path install -a -f -p socat
$feeds_path install -a -f -p theme_argon