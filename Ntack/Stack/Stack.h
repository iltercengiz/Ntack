//
//  Stack.h
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Stack<T> : NSObject

@property (atomic, readonly) NSInteger count;
@property (atomic, readonly) BOOL isEmpty;

- (instancetype)initWithCapacity:(NSInteger)capacity;
+ (instancetype)stack;
+ (instancetype)stackWithCapacity:(NSInteger)capacity;

- (nullable T)pop;
- (void)push:(nonnull T)object;
- (nullable T)peek;

- (nullable NSArray *)allObjects;

@end
