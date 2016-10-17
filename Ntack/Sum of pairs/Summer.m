//
//  Summer.m
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Summer.h"

@implementation Summer

+ (BOOL)array:(NSArray<NSNumber *> *)array hasPairWithSum:(NSInteger)sum {
    if (array.count >= 2) {
        NSNumber *referenceNumber = array.lastObject;
        NSArray<NSNumber *> *subarray = [array subarrayWithRange:NSMakeRange(0, array.count - 1)];
        __block BOOL hasPair = NO;
        [subarray enumerateObjectsUsingBlock:^(NSNumber * _Nonnull number, NSUInteger index, BOOL * _Nonnull stop) {
            if ((sum - referenceNumber.unsignedIntegerValue) == number.unsignedIntegerValue) {
                hasPair = YES;
                *stop = YES;
            }
        }];
        if (hasPair) {
            return hasPair;
        } else {
            return [self array:subarray hasPairWithSum:sum];
        }
    }
    return false;
}

@end
