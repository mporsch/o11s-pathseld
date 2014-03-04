
include $(TOPDIR)/rules.mk

PKG_NAME:=o11s-pathseld
PKG_VERSION:=0.1
PKG_RELEASE:=1

include $(INCLUDE_DIR)/package.mk

define Package/o11s-pathseld
  SECTION:=net
  CATEGORY:=Network
  SUBMENU:=wireless
  TITLE:=Path selection deamon
  DEPENDS:=+libnl
endef

define Package/o11s-pathseld/description
  Path selection deamon
endef

define Build/Prepare
	mkdir -p $(PKG_BUILD_DIR)
	$(CP) -rf ./src $(PKG_BUILD_DIR)/
endef

CONFIGURE_PATH:=src

MAKE_PATH:=src

TARGET_CFLAGS+=$(TARGET_CPPFLAGS)
ONFIGURE_VARS += LIBS="-lnl -lnl-genl"

define Package/o11s-pathseld/install
	$(INSTALL_DIR) $(1)/usr/sbin
	$(INSTALL_BIN) $(PKG_BUILD_DIR)/src/o11s_pathseld $(1)/usr/sbin/
endef

$(eval $(call BuildPackage,o11s-pathseld))
