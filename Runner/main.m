//
//  main.m
//  Runner
//
//  Created by Ilter Cengiz on 13/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rotation.h"

void runRotation() {
    Rotation *rotation = [Rotation new];
    [rotation run];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        runRotation();
    }
    return 0;
}
