//
//  gameModel.h
//  TestApp
//
//  Created by admin on 5/3/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gameModel : NSObject{
    @public
    NSMutableArray *equationHolder;
    int attempt;
    @public
    int skipped;
    int success;
    int timeInSeconds;
    NSMutableArray *assignedNumber;
    Boolean isAssigned;
}
+(gameModel*)getInstance;
-(int)getAttempt;
-(void)setAttempt:(int)a;
@end
