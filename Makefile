export ARCHS = armv7 armv7s arm64
export TARGET = iphone:clang:8.1:8.1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = reachabilityToggles
reachabilityToggles_FRAMEWORKS = UIKit Foundation
reachabilityToggles_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += reachabilitytogglesprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
