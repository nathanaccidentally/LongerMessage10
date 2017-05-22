include $(THEOS)/makefiles/common.mk

TWEAK_NAME = LongerMessage10
LongerMessage10_FILES = Tweak.xm

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += longermessageprefs
include $(THEOS_MAKE_PATH)/aggregate.mk
