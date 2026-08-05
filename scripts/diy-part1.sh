#!/bin/bash
# diy-part1 — 版本号补丁，all distros 共用
# 在 scripts/feeds update 之前运行

date_version=$(date +"%Y%m%d%H")
[ -f version ] && sed -i "s/0000000000/${date_version}/g" version || true


[ -d package/lucky ] && rm -rf package/lucky
[ -d feeds/luci/luci-theme-argon ] && rm -rf feeds/luci/luci-theme-argon


# ===== 拉自定义包 =====

[ -d package/luci-theme-glass ] && rm -rf package/luci-theme-glass 
git clone https://github.com/rchen14b/luci-theme-glass package/luci-theme-glass

[ -d package/luci-theme-argon ] && rm -rf package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

[ -d package/luci-app-lucky ] && rm -rf package/luci-app-lucky
git clone https://github.com/whzhni1/luci-app-lucky package/luci-app-lucky


