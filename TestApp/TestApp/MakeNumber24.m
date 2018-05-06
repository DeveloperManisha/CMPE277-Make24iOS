//
//  MakeNumber24.m
//  TestApp
//
//  Created by admin on 5/5/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import "MakeNumber24.h"
#import <math.h>

@implementation MakeNumber24

+(NSString*)getSolution:(int) a: (int) b: (int) c: (int) d {
    int n[] = { a, b, c, d };
    char o[] = { '+', '-', '*', '/' };
    for (int w = 0; w < 4; w++) {
        for (int x = 0; x < 4; x++) {
            if (x == w)
                continue;
            for (int y = 0; y < 4; y++) {
                if (y == x || y == w)
                    continue;
                for (int z = 0; z < 4; z++) {
                    if (z == w || z == x || z == y)
                        continue;
                    for (int i = 0; i < 4; i++) {
                        for (int j = 0; j < 4; j++) {
                            for (int k = 0; k < 4; k++) {
                                NSString *result = [MakeNumber24 eval:n[w] :n[x] :n[y] :n[z] :o[i] :o[j] :o[k]];
                                if (nil !=result) {
                                    return result;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    return nil;
}

+(NSString*) eval:(int) a :(int) b: (int) c: (int) d :(char) x:(char) y: (char) z{
    @try
    {
        if ([MakeNumber24 bingo:[MakeNumber24 eval:[MakeNumber24 eval:[MakeNumber24 eval:a: x: b]: y: c]: z: d]] ) {
            NSString *result=[NSString stringWithFormat: @"((%d %c%d)%d%c)%c%d",a,x,b,y,c,z,d];
            return result;
        }
        if ([MakeNumber24 bingo:[MakeNumber24 eval:[MakeNumber24 eval:a:x:[MakeNumber24 eval:b:y:c]]: z: d]]) {
            NSString *result=[NSString stringWithFormat: @"(%d%c(%d%c%d)%c%d",a,x,b,y,c,z,d];
            return result;
        }
        if ([MakeNumber24 bingo:[MakeNumber24 eval:a:x:[MakeNumber24 eval:[MakeNumber24 eval:b:y:c]:z: d]]]) {
            NSString *result=[NSString stringWithFormat: @"(%d%c((%d%c%d)%c%d)",a,x,b,y,c,z,d];
            return result;
            
        }
        if ([MakeNumber24 bingo:[MakeNumber24 eval:a:x:[MakeNumber24 eval:b:y:[MakeNumber24 eval:c: z: d]]]]) {
            NSString *result=[NSString stringWithFormat: @"(%d%c(%d%c(%d%c%d))",a,x,b,y,c,z,d];
            return result;
        }
        if ([MakeNumber24 bingo:[MakeNumber24 eval:[MakeNumber24 eval:a: x:b]: y:[MakeNumber24 eval:c: z: d]]]) {
            NSString *result=[NSString stringWithFormat: @"((%d%c%d)%c(%d%c%d))",a,x,b,y,c,z,d];
            return result;
        }
    }
    @catch (NSException *t) {
    }
    @finally {
        NSLog(@"finally");
    }
    return nil;
}

+(double) eval:(double) a:  (char)x: (double) b {
    switch (x) {
        case '+':
            return a + b;
        case '-':
            return a - b;
        case '*':
            return a * b;
        default:
            return a / b;
    }
}
+(void) solve:(int) a: (int) b: (int) c:( int) d {
    // System.out.print("[" + a + ", " + b + ", " + c + ", " + d + "] ");
    NSString *result = [MakeNumber24 getSolution:a :b :c :d];
    if (nil !=result) {
        //System.out.println("Binggo! " + result);
        //return result;
    } else {
        //System.out.println("Too bad, no answers!");
    }
    return;
}
+(Boolean) hasSolution:(int) a: (int) b: (int) c:( int) d {
    // System.out.print("[" + a + ", " + b + ", " + c + ", " + d + "] ");
    NSString *result = [MakeNumber24 getSolution:a :b :c :d];
    Boolean hasSolution = false;
    if (nil !=result) {
        //System.out.println("Binggo! " + result);
        //return result;
        hasSolution = true;
    } else {
        //System.out.println("Too bad, no answers!");
        hasSolution = false;
    }
    return hasSolution;
}
+(bool)bingo:(double)x {
    return fabs(x - 24) < 0.0000001;
}
@end
