//
//  MyObject.m
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

#import "MyObject.h"

@implementation MyObject

- (NSString *)property1and2 {
    return [self.property1 stringByAppendingString:self.property2];
}

+ (NSSet<NSString *> *)keyPathsForValuesAffectingProperty1and2 {
    return [NSSet setWithObjects:@"property1", @"property2", nil];
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
