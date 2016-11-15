//
//  MergeSort.m
//  Ntack
//
//  Created by Ilter Cengiz on 15/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "MergeSort.h"

@implementation MergeSort

- (void)run {
    int dataSetCount;
    printf("Enter the number of data sets that will be entered: ");
    scanf("%i", &dataSetCount);
    NSMutableArray *swapCounts = [NSMutableArray arrayWithCapacity:dataSetCount];
    for (int count = 0; count < dataSetCount; count++) {
        int numberOfNumber;
        printf("Enter the number of numbers in the data set: ");
        scanf("%i", &numberOfNumber);
        NSMutableArray<NSNumber *> *array = [NSMutableArray arrayWithCapacity:numberOfNumber];
        printf("Enter numbers: ");
        for (int index = 0; index < numberOfNumber; index++) {
            NSInteger number;
            scanf("%d", &number);
            [array addObject:@(number)];
        }
        int swapCount = 0;
        printf("Processing...\n");
        [self mergeSort:[NSArray arrayWithArray:array] swapCount:&swapCount];
        swapCounts[count] = @(swapCount);
        printf("Process has finished!\n");
    }
    for (int index = 0; index < dataSetCount; index++) {
        NSNumber *swapCount = swapCounts[index];
        printf("%i\n", swapCount.integerValue);
    }
}

- (NSArray<NSNumber *> *)mergeSort:(NSArray<NSNumber *> *)array swapCount:(int *)swapCount {
    if (array.count <= 1) {
        return array;
    }
    // Split array into two
    NSMutableArray *left = [NSMutableArray arrayWithCapacity:(array.count / 2)];
    NSMutableArray *right = [NSMutableArray arrayWithCapacity:(array.count / 2)];
    [array enumerateObjectsUsingBlock:^(NSNumber * _Nonnull number, NSUInteger index, BOOL * _Nonnull stop) {
        if (index < (array.count / 2)) {
            [left addObject:number];
        } else {
            [right addObject:number];
        }
    }];
    // Sort left and right parts
    NSArray *sortedLeft = [self mergeSort:[NSArray arrayWithArray:left] swapCount:swapCount];
    NSArray *sortedRight = [self mergeSort:[NSArray arrayWithArray:right] swapCount:swapCount];
    // Merge left and right parts
    return [self mergeArray:sortedLeft withArray:sortedRight swapCount:swapCount];
}

- (NSArray<NSNumber *> *)mergeArray:(NSArray<NSNumber *> *)left withArray:(NSArray<NSNumber *> *)right swapCount:(int *)swapCount {
    NSMutableArray<NSNumber *> *result = [NSMutableArray arrayWithCapacity:(left.count + right.count)];
    NSInteger leftIndex = 0, rightIndex = 0;
    while (leftIndex < left.count || rightIndex < right.count) {
        NSNumber *leftNumber = nil;
        if (leftIndex < left.count) {
            leftNumber = left[leftIndex];
        }
        NSNumber *rightNumber = nil;
        if (rightIndex < right.count) {
            rightNumber = right[rightIndex];
        }
        if (leftNumber && rightNumber) {
            if ([leftNumber compare:rightNumber] == NSOrderedAscending ||
                [leftNumber compare:rightNumber] == NSOrderedSame) {
                [result addObject:leftNumber];
                leftIndex++;
            } else {
                [result addObject:rightNumber];
                rightIndex++;
                *swapCount = (*swapCount + 1);
            }
        } else if (leftNumber) {
            [result addObject:leftNumber];
            leftIndex++;
        } else if (rightNumber) {
            [result addObject:rightNumber];
            rightIndex++;
        }
    }
    return [NSArray arrayWithArray:result];
}

@end
