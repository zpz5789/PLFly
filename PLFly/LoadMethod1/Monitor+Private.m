//
//  Monitor+Private.m
//  PLFly
//
//  Created by 曾鹏展 on 2023/1/29.
//

#import "Monitor+Private.h"

@implementation Monitor (Private)

+ (void)load {
    [self swiftLoad];
}
 
+ (void)initialize {
    [self swiftInitialize];
}
 
@end
