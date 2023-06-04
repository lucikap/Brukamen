include $(TOPDIR)/rules.mk
include $(TOPDIR)/feeds/luci/luci.mk

PKG_NAME:=luci-app-Brukamen_WiFi
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
	TITLE:=LuCI support for Brukamen_WiFi
endef

define Package/$(PKG_NAME)/description
  This package contains the LuCI web interface for the Brukamen_WiFi plugin.
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
endef

$(eval $(call BuildPackage,luci-app-Brukamen_WiFi))
