//
//  TestObject.h
//  Juny_UnitTestDemo
//
//  Created by sy on 2017/4/11.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TestObject : NSObject

@property (nonatomic, copy)NSString *name;

- (NSInteger)addA:(NSInteger)mA andB:(NSInteger)mB;
- (NSInteger)reduceB:(NSInteger)mb froma:(NSInteger)mA;

@end
