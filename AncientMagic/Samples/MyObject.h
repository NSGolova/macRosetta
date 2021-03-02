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

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *surname;
@property (nonatomic, strong, readonly) NSString *fullname;

@end

@interface MyObjectOwner : NSObject

@end

NS_ASSUME_NONNULL_END
