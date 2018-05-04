//
//  gameModel.h
//  TestApp
//
//  Created by admin on 5/3/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface gameModel : NSObject
@property (strong, nonatomic) NSMutableArray *equationHolder;
@property (nonatomic,assign) int attempt;
@property (nonatomic,assign) int skipped;
@property (nonatomic,assign) int success;
@property (weak, nonatomic) NSTimer *puzzleTimer;
@property int timeInSeconds;
@property (strong, nonatomic) NSMutableArray *assignedNumber;
@property Boolean isAssigned;

@end
