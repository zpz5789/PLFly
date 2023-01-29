//
//  NSSwiftLoadProtocol.h
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/29.
//

#import <Foundation/Foundation.h>

@protocol NSSwiftLoadProtocol <NSObject>
@optional
+ (void)swiftLoad;
+ (void)swiftInitialize;
@end

#define SWIFTY_LOAD_INITIALIZE(className) \
@interface className(swizzle_swifty_hook)\
@end\
\
@implementation className(swizzle_swifty_hook)\
+ (void)load {if ([[self class] respondsToSelector:@selector(swiftLoad)]) {[[self class] swiftLoad];}}\
+ (void)initialize {if ([[self class] respondsToSelector:@selector(swiftInitialize)]) {[[self class]     swiftInitialize];}}\
@end

