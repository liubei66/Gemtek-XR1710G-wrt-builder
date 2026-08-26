#!/bin/bash
# Immortalwrt DIY part2
# — 在 .config 加载之后、make 之前运行 —

# =================================================================
# 步骤 1：【最先执行】加载你的第三方插件包配置（包含你的 mihomo 配置）
# =================================================================
PKG_CONF="$GITHUB_WORKSPACE/packages/immortalwrt.conf"
if [ -f "$PKG_CONF" ]; then
  grep -v '^#' "$PKG_CONF" | grep -v '^$' >>.config
  echo "已成功加载第三方插件配置"
fi

# =================================================================
# 【彻底物理删除】你不想要的app
# =================================================================
rm -rf package/feeds/video/sdl3
rm -rf package/feeds/video/sdl2-compat
rm -rf package/feeds/video/sdl3-*
rm -rf feeds/video/video/sdl3*
rm -rf feeds/luci/applications/luci-app-clientstatus
rm -rf package/feeds/luci/luci-app-clientstatus
rm -rf package/lucky
rm -rf feeds/luci/luci-theme-argon

echo "正在降级替换 libffi 源码..."
rm -rf feeds/packages/libs/libffi
git clone https://github.com/openwrt/packages.git tmp/openwrt-packages --depth=1
cp -r tmp/openwrt-packages/libs/libffi feeds/packages/libs/
rm -rf tmp/openwrt-packages

sed -i '/CONFIG_PACKAGE_luci-i18n-clientstatus-zh-cn/d' .config
sed -i '/CONFIG_PACKAGE_luci-app-clientstatus/d' .config
sed -i '/CONFIG_PACKAGE_mihomo-alpha/d' .config

[ -f package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json ] && sed -i 's#admin/services/ksmbd#admin/nas/ksmbd#g' ./package/feeds/luci/luci-app-ksmbd/root/usr/share/luci/menu.d/luci-app-ksmbd.json

[ -f package/feeds/luci/feeds/luci/applications/luci-app-nfs/root/etc/init.d/nfs ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/nfs" package/feeds/luci/feeds/luci/applications/luci-app-nfs/root/etc/init.d/nfs

[ -d package/base-files/files/etc/profile.d ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/30-sysinfo.sh" package/base-files/files/etc/profile.d/

[ -d package/base-files/files/etc ] && cp "$GITHUB_WORKSPACE/diy-part2.d/.diy/banner" package/base-files/files/etc/banner
