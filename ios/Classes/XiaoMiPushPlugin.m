#import "XiaoMiPushPlugin.h"
#if __has_include(<xiao_mi_push_plugin/xiao_mi_push_plugin-Swift.h>)
#import <xiao_mi_push_plugin/xiao_mi_push_plugin-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "xiao_mi_push_plugin-Swift.h"
#endif

@implementation XiaoMiPushPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftXiaoMiPushPlugin registerWithRegistrar:registrar];
}
@end
