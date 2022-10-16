#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)


# Mod zzz-default-settings
pushd package/lean/default-settings/files
sed -i '/http/d' zzz-default-settings
export orig_version=$(cat "zzz-default-settings" | grep DISTRIB_REVISION= | awk -F "'" '{print $2}')
export date_version=$(date -d "$(rdate -n -4 -p ntp.aliyun.com)" +'%Y-%m-%d')
sed -i "s/${orig_version}/${orig_version} (${date_version})/g" zzz-default-settings
popd


# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd
sed -i 's/5.15/5.10/g' target/linux/rockchip/Makefile
# Modify default IP
sed -i 's/192.168.1.1/192.168.233.233/g' package/base-files/files/bin/config_generate


# 替换默认主题为 luci-theme-argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/' feeds/luci/collections/luci/Makefile


# 风扇脚本
wget -P target/linux/rockchip/armv8/base-files/etc/init.d/ https://github.com/orangepi-xunlong/openwrt/blob/openwrt-21.02/target/linux/rockchip/armv8/base-files/etc/init.d/pwm-fan
wget -P target/linux/rockchip/armv8/base-files/etc/rc.d/ https://github.com/orangepi-xunlong/openwrt/blob/openwrt-21.02/target/linux/rockchip/armv8/base-files/etc/rc.d/S21pwm-fan
wget -P target/linux/rockchip/armv8/base-files/usr/bin/ https://github.com/orangepi-xunlong/openwrt/blob/openwrt-21.02/target/linux/rockchip/armv8/base-files/usr/bin/pwm-fan.sh


# 添加zsh
mkdir -p files/root
pushd files/root


## Install oh-my-zsh
# Clone oh-my-zsh repository
git clone https://github.com/robbyrussell/oh-my-zsh ./.oh-my-zsh


# Install extra plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
# Get .zshrc dotfile
cp $GITHUB_WORKSPACE/.zshrc .
popd
