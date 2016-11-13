//
//  Rotation.m
//  Ntack
//
//  Created by Ilter Cengiz on 13/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import "Rotation.h"

@implementation Rotation

- (void)run {
    int count;
    printf("Enter the number of elements: ");
    scanf("%i", &count);
    int amount;
    printf("Enter the number of rounds: ");
    scanf("%i", &amount);
    int array[count];
    for(int index = 0; index < count; index++){
        printf("Enter the element #%i ", index);
        scanf("%d", &array[index]);
    }
    [self rotateCArray:array count:count by:amount];
}

- (void)rotateCArray:(int *)array count:(int)count by:(int)amount {
    for (int round = 0; round < amount; round++) {
        int swap = array[0];
        for (int index = 1; index < count; index++) {
            array[index - 1] = array[index];
        }
        array[count - 1] = swap;
    }
    for (int index = 0; index < count; index++) {
        printf("%i ", array[index]);
    }
    printf("\n");
}

@end
