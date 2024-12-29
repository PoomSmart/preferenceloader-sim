#ifndef __DEBUG_H
#define __DEBUG_H

#ifndef DEBUG_TAG
#define DEBUG_TAG "PreferenceLoader"
#endif

#if DEBUG
#import <HBLog.h>

#define PLLog(...) HBLogDebug(@ DEBUG_TAG "! %s:%d: %@", __FILE__, __LINE__, [NSString stringWithFormat:__VA_ARGS__])
#else
#define PLLog(...)
#endif

#endif
