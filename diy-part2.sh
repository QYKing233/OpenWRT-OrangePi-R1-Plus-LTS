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
