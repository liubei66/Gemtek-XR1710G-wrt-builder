#!/bin/bash

# 删除feeds中的插件
rm -rf ./package/feeds/packages/net/{geoview,chinadns-ng,hysteria,mosdns,v2ray-geodata,lucky}
rm -rf ./package/feeds/packages/net/{shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev}
rm -rf ./package/feeds/packages/net/{sing-box,v2ray-geodata,v2ray-plugin,xray-core,smartdns}
rm -rf ./package/feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-openclash,luci-app-homeproxy}
rm -rf ./package/feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-timecontrol,luci-app-mosdns}
rm -rf ./package/feeds/luci/applications/{luci-app-nikki,luci-app-momo,luci-app-daed}


# 克隆的源码放在small文件夹
mkdir package/small
pushd package/small


# luci-app-timecontrol
git clone https://github.com/sirpdboy/luci-app-timecontrol.git

# VIKINGYFY/packages
git clone https://github.com/VIKINGYFY/packages.git

# daed
git clone https://github.com/QiuSimons/luci-app-daed.git

npm install -g pnpm

#passwall package
git clone https://github.com/Openwrt-Passwall/openwrt-passwall-packages.git


popd



sed -i 's#admin/services/ksmbd#admin/nas/ksmbd#g' package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json

echo "packages executed successfully!"
