#!/bin/bash
#
# Copyright (c) 2019-2020 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)

#### Clone community packages to package/community

mkdir package/community
pushd package/community


# Add luci-app-alist
git clone https://github.com/sbwml/luci-app-alist


# Add luci-app-passwall
git clone --depth=1 https://github.com/xiaorouji/openwrt-passwall.git
svn export https://github.com/xiaorouji/openwrt-passwall/branches/luci/luci-app-passwall


# Add luci-app-ssr-plus
git clone --depth=1 https://github.com/fw876/helloworld.git


# Add luci-app-vssr
git clone --depth=1 https://github.com/jerrykuku/lua-maxminddb.git
git clone --depth=1 https://github.com/jerrykuku/luci-app-vssr.git


# Add OpenClash
svn export https://github.com/vernesong/OpenClash/trunk/luci-app-openclash


# Add luci-app-onliner (need luci-app-nlbwmon)
git clone --depth=1 https://github.com/rufengsuixing/luci-app-onliner.git


# Add luci-app-poweroff
git clone --depth=1 https://github.com/esirplayground/luci-app-poweroff.git


# Add luci-app-adguardhome
svn export https://github.com/Boos4721/OpenWrt-Packages/trunk/luci-app-adguardhome


# Add luci-app-argon-config & luci-app-argon 
git clone --depth=1 https://github.com/jerrykuku/luci-app-argon-config.git
git clone --depth=1 https://github.com/jerrykuku/luci-theme-argon.git


# Add open-app-filter
git clone --depth=1 https://github.com/destan19/OpenAppFilter.git


# Add luci-theme-neobird
git clone --depth=1 https://github.com/thinktip/luci-theme-neobird.git


# Add luci-app-syncthing
svn export https://github.com/kenzok8/small-package/trunk/luci-app-syncthing


# Add luci-app-filebrowser
svn export https://github.com/kenzok8/small-package/trunk/luci-app-filebrowser
svn export https://github.com/kenzok8/small-package/trunk/filebrowser


# Add luci-app-fileassistant
svn export https://github.com/kenzok8/small-package/trunk/luci-app-fileassistant


# Add luci-app-beardropper
svn export https://github.com/kenzok8/small-package/trunk/luci-app-beardropper



### exit package/community
popd
