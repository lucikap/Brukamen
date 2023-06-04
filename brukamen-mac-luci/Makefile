include $(TOPDIR)/rules.mk
include $(TOPDIR)/feeds/luci/luci.mk

PKG_NAME:=luci-app-brukamen-mac
PKG_VERSION:=1.5.0
PKG_RELEASE:=1

PKG_LICENSE:=GPL-3.0
PKG_MAINTAINER:=Brukamen

PKG_BUILD_DIR:=$(BUILD_DIR)/$(PKG_NAME)

include $(INCLUDE_DIR)/package.mk

define Package/$(PKG_NAME)
	SECTION:=luci
	CATEGORY:=LuCI
	SUBMENU:=3. Applications
	TITLE:=LuCI support for Brukamen MAC
	DEPENDS:=+lua +luci-base +luci-compat
endef

define Package/$(PKG_NAME)/description
	This package contains the LuCI web interface for the Brukamen MAC plugin.
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
endef

define Build/Configure
endef

define Build/Compile
endef

define Package/$(PKG_NAME)/install
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/controller
	$(CP) ./luasrc/controller/* $(1)/usr/lib/lua/luci/controller/
	$(INSTALL_DIR) $(1)/usr/lib/lua/luci/model/cbi
	$(CP) ./luasrc/model/cbi/* $(1)/usr/lib/lua/luci/model/cbi/
	$(INSTALL_DIR) $(1)/etc/config
	$(INSTALL_CONF) ./root/etc/config/brukamen_mac $(1)/etc/config/brukamen_mac
	$(foreach po,$(wildcard i18n/*/brukamen_mac.po), \
	$(call Build/i18n/compile_template,$(po),$(1)/usr/lib/lua/luci/i18n/$(notdir $(patsubst %/,%,$(dir $(po)))).lmo))
endef

$(eval $(call BuildPackage,$(PKG_NAME)))
