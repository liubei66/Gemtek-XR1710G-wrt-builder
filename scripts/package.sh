#!/bin/bash

# 删除feeds中的插件
rm -rf ./package/feeds/packages/net/{geoview,chinadns-ng,hysteria,mosdns,v2ray-geodata,lucky}
rm -rf ./package/feeds/packages/net/{shadowsocks-libev,shadowsocks-rust,shadowsocksr-libev}
rm -rf ./package/feeds/packages/net/{sing-box,v2ray-geodata,v2ray-plugin,xray-core,smartdns,dae,daed}
rm -rf ./package/feeds/luci/applications/{luci-app-passwall,luci-app-passwall2,luci-app-openclash,luci-app-homeproxy}
rm -rf ./package/feeds/luci/applications/{luci-app-lucky,luci-app-smartdns,luci-app-timecontrol,luci-app-mosdns}
rm -rf ./package/feeds/luci/applications/{luci-app-nikki,luci-app-momo,luci-app-daed,luci-app-dae}


# 克隆的源码放在small文件夹
mkdir package/small
pushd package/small


# luci-app-timecontrol
git clone https://github.com/sirpdboy/luci-app-timecontrol.git

npm install -g pnpm


popd


echo "packages executed successfully!"
