//
//  Stack.m
//  Ntack
//
//  Created by Ilter Cengiz on 17/10/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Stack.h"

@interface Stack ()

@property (atomic) NSMutableArray *stack;

@end

@implementation Stack

@dynamic count, isEmpty;

#pragma mark - Initialization

- (instancetype)init {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray array];
    }
    return self;
}

- (instancetype)initWithCapacity:(NSInteger)capacity {
    self = [super init];
    if (self) {
        _stack = [NSMutableArray arrayWithCapacity:capacity];
    }
    return self;
}

+ (instancetype)stack {
    return [Stack new];
}

+ (instancetype)stackWithCapacity:(NSInteger)capacity {
    return [[Stack alloc] initWithCapacity:capacity];
}

#pragma mark - Getter

- (NSInteger)count {
    @synchronized (self) {
        return self.stack.count;
    }
}

- (BOOL)isEmpty {
    @synchronized (self) {
        return self.stack.count == 0;
    }
}

#pragma mark - Public methods

- (nullable id)pop {
    @synchronized (self) {
        if (self.count > 0) {
            id object = self.stack.lastObject;
            [self.stack removeLastObject];
            return object;
        }
        return nil;
    }
}

- (void)push:(nonnull id)object {
    @synchronized (self) {
        [self.stack addObject:object];
    }
}

- (nullable id)peek {
    @synchronized (self) {
        return self.stack.lastObject;
    }
}

- (nullable NSArray *)allObjects {
    @synchronized (self) {
        return [NSArray arrayWithArray:self.stack];
    }
}

@end
