//
//  TestObject.m
//  Juny_UnitTestDemo
//
//  Created by sy on 2017/4/11.
//  Copyright © 2017年 Juny. All rights reserved.
//

#import "TestObject.h"

@implementation TestObject
- (NSInteger)addA:(NSInteger)mA andB:(NSInteger)mB{
    return mA+mB;
}

- (NSInteger)reduceB:(NSInteger)mb froma:(NSInteger)mA{
    return mA - mb;
}
@end
