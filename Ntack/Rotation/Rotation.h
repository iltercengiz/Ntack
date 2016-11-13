//
//  Rotation.h
//  Ntack
//
//  Created by Ilter Cengiz on 13/11/2016.
//  Copyright © 2016 Ilter Cengiz. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Rotation : NSObject

- (void)run;
- (void)rotateCArray:(int *)array count:(int)count by:(int)amount;

@end
