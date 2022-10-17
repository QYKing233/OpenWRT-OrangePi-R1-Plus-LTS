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
#


# Remove default luci-theme-argon
pushd package/lean  
rm -rf luci-theme-argon 
popd


# Modify default IP
sed -i 's/192.168.1.1/192.168.233.233/g' package/base-files/files/bin/config_generate


# Add offical-pwm-fan
#
mkdir -p target/linux/rockchip/armv8/base-files/etc/init.d
pushd target/linux/rockchip/armv8/base-files/etc/init.d
cp $GITHUB_WORKSPACE/pwm-fan .
popd
#
mkdir -p target/linux/rockchip/armv8/base-files/etc/rc.d
pushd target/linux/rockchip/armv8/base-files/etc/rc.d
cp $GITHUB_WORKSPACE/S21pwm-fan .
popd
#
mkdir -p target/linux/rockchip/armv8/base-files/usr/bin
pushd target/linux/rockchip/armv8/base-files/usr/bin
cp $GITHUB_WORKSPACE/pwm-fan.sh .
popd
#


## Install oh-my-zsh
mkdir -p files/root
pushd files/root
# Clone oh-my-zsh repository
git clone https://github.com/robbyrussell/oh-my-zsh ./.oh-my-zsh
# Install extra plugins
git clone https://github.com/zsh-users/zsh-autosuggestions ./.oh-my-zsh/custom/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ./.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-completions ./.oh-my-zsh/custom/plugins/zsh-completions
cp $GITHUB_WORKSPACE/.zshrc .
popd


# Change default shell to zsh
sed -i 's/\/bin\/ash/\/usr\/bin\/zsh/g' package/base-files/files/etc/passwd


# Change kernel version
# sed -i 's/5.15/5.10/g' target/linux/x86/Makefile
