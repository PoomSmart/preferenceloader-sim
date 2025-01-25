#import <Preferences/PSListController.h>
#import <Preferences/PSSpecifier.h>
#import <UIKit/UIFunctions.h>

@interface PSListController (libprefs)
- (NSArray *)specifiersFromEntry:(NSDictionary *)entry sourcePreferenceLoaderBundlePath:(NSString *)sourceBundlePath title:(NSString *)title;
@end

extern NSString *const PLFilterKey;

@interface PSSpecifier (libprefs)
+ (BOOL)environmentPassesPreferenceLoaderFilter:(NSDictionary *)filter;
@property (nonatomic, retain, readonly) NSBundle *preferenceLoaderBundle;
@end

@interface PLCustomListController: PSListController { }
@end

@interface PLLocalizedListController: PLCustomListController { }
@end

#define _realPath2(path) [UISystemRootDirectory() stringByAppendingPathComponent:path]

#define _realPath(path) ([_realPath2(@path) UTF8String])
