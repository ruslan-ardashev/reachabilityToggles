include theos/makefiles/common.mk

BUNDLE_NAME = reachabilityTogglesPrefs
reachabilityTogglesPrefs_FILES = reachabilityTogglesPrefs.mm
reachabilityTogglesPrefs_INSTALL_PATH = /Library/PreferenceBundles
reachabilityTogglesPrefs_FRAMEWORKS = UIKit
reachabilityTogglesPrefs_PRIVATE_FRAMEWORKS = Preferences

include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/reachabilityTogglesPrefs.plist$(ECHO_END)
