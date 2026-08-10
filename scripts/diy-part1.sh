#!/bin/bash
# diy-part1 — 版本号补丁，all distros 共用
# 在 scripts/feeds update 之前运行

date_version=$(date +"%Y%m%d%H")
[ -f version ] && sed -i "s/0000000000/${date_version}/g" version || true

# 删除feeds中的插件
[ -d package/lucky ] && rm -rf package/lucky
[ -d feeds/luci/luci-theme-argon ] && rm -rf feeds/luci/luci-theme-argon
rm -rf ./package/feeds/packages/net/{geoview,chinadns-ng,hysteria,mosdns,v2ray-geodata,lucky}
rm -rf ./package/feeds/packages/net/{shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev}
rm -rf ./package/feeds/packages/net/{sing-box,v2ray-geodata,v2ray-plugin,xray-core,smartdns,dae,daed}
rm -rf ./package/feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-openclash,luci-app-homeproxy}
rm -rf ./package/feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-timecontrol,luci-app-mosdns}
rm -rf ./package/feeds/luci/applications/{luci-app-nikki,luci-app-momo,luci-app-daed,luci-app-dae,luci-theme-argon}

# 克隆的源码放在small文件夹
mkdir package/small
pushd package/small

# luci-app-timecontrol
git clone https://github.com/sirpdboy/luci-app-timecontrol.git

npm install -g pnpm

popd


# ===== 拉自定义包 =====

[ -d package/OpenWrt-nikki ] && rm -rf package/OpenWrt-nikki
git clone https://github.com/nikkinikki-org/OpenWrt-nikki.git package/OpenWrt-nikki

[ -d package/openwrt-passwall ] && rm -rf package/openwrt-passwall
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git package/openwrt-passwall

[ -d package/app-run ] && rm -rf package/app-run
git clone https://github.com/wukongdaily/luci-app-run.git package/app-run

[ -d package/poweroffdevice ] && rm -rf package/poweroffdevice
git clone https://github.com/sirpdboy/luci-app-poweroffdevice.git package/poweroffdevice

[ -d package/openwrt-clashoo ] && rm -rf package/openwrt-clashoo
git clone https://github.com/kenzok8/openwrt-clashoo.git package/openwrt-clashoo

[ -d package/kcptun ] && rm -rf package/kcptun
git clone https://github.com/kuoruan/openwrt-kcptun.git package/kcptun

[ -d package/luci-theme-glass ] && rm -rf package/luci-theme-glass
git clone https://github.com/rchen14b/luci-theme-glass package/luci-theme-glass

[ -d package/luci-theme-argon ] && rm -rf package/luci-theme-argon
git clone https://github.com/jerrykuku/luci-theme-argon package/luci-theme-argon

[ -d package/luci-app-lucky ] && rm -rf package/luci-app-lucky
git clone https://github.com/whzhni1/luci-app-lucky package/luci-app-lucky

[ -d package/openwrt-daede ] && rm -rf package/openwrt-daede
git clone https://github.com/kenzok8/openwrt-daede.git package/openwrt-daede



