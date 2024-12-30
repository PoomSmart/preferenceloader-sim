PL_SIMULATOR_VERSION := 15.0

ifeq ($(shell echo "$(PL_SIMULATOR_VERSION) >= 16.0" | bc),1)
PL_SIMULATOR_ROOT = /Library/Developer/CoreSimulator/Volumes/*/Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ $(PL_SIMULATOR_VERSION).simruntime/Contents/Resources/RuntimeRoot
else
PL_SIMULATOR_ROOT = /Library/Developer/CoreSimulator/Profiles/Runtimes/iOS\ $(PL_SIMULATOR_VERSION).simruntime/Contents/Resources/RuntimeRoot
endif

PL_SIMULATOR_BUNDLES_PATH = $(PL_SIMULATOR_ROOT)/Library/PreferenceBundles
PL_SIMULATOR_PLISTS_PATH = $(PL_SIMULATOR_ROOT)/Library/PreferenceLoader/Preferences
