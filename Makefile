TARGET = simulator:clang:17.2:8.0
ARCHS = arm64 x86_64
# ARCHS = x86_64 i386 # for Intel Mac

include $(THEOS)/makefiles/common.mk

# LIBRARY_NAME = libprefs
# libprefs_LOGOSFLAGS = -c generator=MobileSubstrate
# libprefs_FILES = prefs.xm
# libprefs_FRAMEWORKS = UIKit
# libprefs_PRIVATE_FRAMEWORKS = Preferences
# libprefs_CFLAGS = -I.
# libprefs_COMPATIBILITY_VERSION = 2.2.0
# libprefs_LIBRARY_VERSION = $(shell echo "$(THEOS_PACKAGE_BASE_VERSION)" | cut -d'~' -f1)
# libprefs_LDFLAGS = -compatibility_version $($(THEOS_CURRENT_INSTANCE)_COMPATIBILITY_VERSION)
# # libprefs_LDFLAGS += -current_version $($(THEOS_CURRENT_INSTANCE)_LIBRARY_VERSION)
# libprefs_LDFLAGS += -rpath /usr/lib
# libprefs_LDFLAGS += -Xlinker -not_for_dyld_shared_cache

TWEAK_NAME = PreferenceLoader
PreferenceLoader_FILES = prefs.xm Tweak.xm
PreferenceLoader_LOGOSFLAGS = -c generator=MobileSubstrate
PreferenceLoader_FRAMEWORKS = UIKit
PreferenceLoader_PRIVATE_FRAMEWORKS = Preferences
# PreferenceLoader_LIBRARIES = prefs
PreferenceLoader_CFLAGS = -I.
PreferenceLoader_LDFLAGS = -L$(THEOS_OBJ_DIR)

# include $(THEOS_MAKE_PATH)/library.mk
include $(THEOS_MAKE_PATH)/tweak.mk

include locatesim.mk

setup:: clean all
	@[ -d "$(PL_SIMULATOR_BUNDLES_PATH)" ] || sudo mkdir -p "$(PL_SIMULATOR_BUNDLES_PATH)"
	@[ -d "$(PL_SIMULATOR_PLISTS_PATH)" ] || sudo mkdir -p "$(PL_SIMULATOR_PLISTS_PATH)"
	# @rm -f /opt/simject/$(LIBRARY_NAME).dylib
	# @cp -v $(THEOS_OBJ_DIR)/$(LIBRARY_NAME).dylib /opt/simject
	@rm -f /opt/simject/$(TWEAK_NAME).dylib
	@cp -v $(THEOS_OBJ_DIR)/$(TWEAK_NAME).dylib /opt/simject
	@cp -v $(PWD)/$(TWEAK_NAME).plist /opt/simject

remove::
	@[ ! -d "$(PL_SIMULATOR_BUNDLES_PATH)" ] || sudo rm -r "$(PL_SIMULATOR_BUNDLES_PATH)"
	@[ ! -d "$(PL_SIMULATOR_PLISTS_PATH)" ] || sudo rm -r "$(PL_SIMULATOR_PLISTS_PATH)"
	@rm -f /opt/simject/$(TWEAK_NAME).dylib /opt/simject/$(TWEAK_NAME).plist
