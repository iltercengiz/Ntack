//
//  main.m
//  Runner
//
//  Created by Ilter Cengiz on 13/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Rotation.h"
#import "Anagram.h"
#import "MergeSort.h"

void runRotation() {
    Rotation *rotation = [Rotation new];
    [rotation run];
}

void runAnagram() {
    Anagram *anagram = [Anagram new];
    [anagram run];
}

void runMergeSort() {
    MergeSort *mergeSort = [MergeSort new];
    [mergeSort run];
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        NSLog(@"Hello, World!");
        // runRotation();
        // runAnagram();
        runMergeSort();
    }
    return 0;
}
