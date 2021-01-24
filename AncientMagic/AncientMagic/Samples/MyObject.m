//
//  MyObject.m
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

#import "MyObject.h"

@implementation MyObject

- (NSString *)fullname {
    return [self.name stringByAppendingFormat:@" %@", self.surname];
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingFullname {
    return [NSSet setWithObjects:@"name", @"surname", nil];
}

@end

static const char kAMMyBelowedClassOwnerMyObjectPropertyKVOContext = 0;

@interface MyObjectOwner()

@property MyObject *myObject;

@end

@implementation MyObjectOwner

- (instancetype)init
{
    self = [super init];
    if (self) {
        [_myObject addObserver:self forKeyPath:@"property" options:(NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld) context:(void *)&kAMMyBelowedClassOwnerMyObjectPropertyKVOContext];
    }
    return self;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    if (context == &kAMMyBelowedClassOwnerMyObjectPropertyKVOContext)
    {
        // id newValue = change[NSKeyValueChangeNewKey];
        // id oldValue = change[NSKeyValueChangeOldKey];
        
        // Do observing
    }
    else
    {
        [super observeValueForKeyPath:keyPath ofObject:object change:change context:context];
    }
}

- (void)dealloc
{
    [_myObject removeObserver:self forKeyPath:@"property" context:(void *)&kAMMyBelowedClassOwnerMyObjectPropertyKVOContext];
}

@end
