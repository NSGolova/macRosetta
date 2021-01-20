//
//  MyObject.h
//  AncientMagic
//
//  Created by Viktor Radulov on 1/17/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyObject : NSObject

@property (nonatomic, strong) MyObject *property;

@property (nonatomic, strong) NSString *property1;
@property (nonatomic, strong) NSString *property2;
@property (nonatomic, strong, readonly) NSString *property1and2;

@end

@interface MyObjectOwner : NSObject

@end

NS_ASSUME_NONNULL_END
