//
//  Anagram.m
//  Ntack
//
//  Created by Ilter Cengiz on 13/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Anagram.h"

@implementation Anagram

- (void)run {
    NSString *a;
    char *a_temp = (char *)malloc(512000 * sizeof(char));
    printf("Enter the first string: ");
    scanf("%s", a_temp);
    a = [NSString stringWithFormat:@"%s", a_temp];
    NSString *b;
    char *b_temp = (char *)malloc(512000 * sizeof(char));
    printf("Enter the second string: ");
    scanf("%s", b_temp);
    b = [NSString stringWithFormat:@"%s", b_temp];
    printf("%i\n", [self numberOfDeletionsToMakeAnagramFrom:a with:b]);
}

- (NSInteger)numberOfDeletionsToMakeAnagramFrom:(NSString *)string1 with:(NSString *)string2 {
    NSMutableDictionary *counts = [NSMutableDictionary dictionary];
    for (NSInteger index = 0; index < string1.length; index++) {
        unichar character = [string1 characterAtIndex:index];
        NSString *strChar = [NSString stringWithCharacters:&character length:1];
        NSNumber *numberCount = counts[strChar];
        if (numberCount) {
            NSInteger count = numberCount.integerValue;
            count++;
            counts[strChar] = @(count);
        } else {
            counts[strChar] = @1;
        }
    }
    for (NSInteger index = 0; index < string2.length; index++) {
        unichar character = [string2 characterAtIndex:index];
        NSString *strChar = [NSString stringWithCharacters:&character length:1];
        NSNumber *numberCount = counts[strChar];
        if (numberCount) {
            NSInteger count = numberCount.integerValue;
            count--;
            counts[strChar] = @(count);
        } else {
            counts[strChar] = @(-1);
        }
    }
    NSArray *values = counts.allValues;
    NSInteger total = 0;
    for (NSNumber *value in values) {
        total += abs(value.integerValue);
    }
    return total;
}

@end
