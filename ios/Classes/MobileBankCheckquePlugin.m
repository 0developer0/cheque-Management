#import "MobileBankCheckquePlugin.h"
#if __has_include(<mobile_bank_checkque/mobile_bank_checkque-Swift.h>)
#import <mobile_bank_checkque/mobile_bank_checkque-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "mobile_bank_checkque-Swift.h"
#endif

@implementation MobileBankCheckquePlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftMobileBankCheckquePlugin registerWithRegistrar:registrar];
}
@end
