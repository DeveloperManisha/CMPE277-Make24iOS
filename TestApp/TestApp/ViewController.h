//
//  ViewController.h
//  TestApp
//
//  Created by Siddheshwar Narke on 4/29/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "gameModel.h"

@interface ViewController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *Number1;
@property (weak, nonatomic) IBOutlet UIButton *Number2;
@property (weak, nonatomic) IBOutlet UIButton *Number3;
@property (weak, nonatomic) IBOutlet UIButton *Number4;
@property (weak, nonatomic) IBOutlet UILabel *successLabel;
@property (weak, nonatomic) IBOutlet UILabel *skippedLabel;
@property (weak, nonatomic) IBOutlet UILabel *attemptLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *equationHolderLabel;
@property (weak, nonatomic) IBOutlet UIButton *signPlus;
@property (weak, nonatomic) IBOutlet UIButton *signMinus;
@property (weak, nonatomic) IBOutlet UIButton *signMultiply;
@property (weak, nonatomic) IBOutlet UIButton *signDivision;
@property (weak, nonatomic) IBOutlet UIButton *signOpeningBrace;
@property (weak, nonatomic) IBOutlet UIButton *signClosingBrace;
@property (weak, nonatomic) IBOutlet UIButton *backspace;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;
@property (strong, nonatomic) NSMutableArray *equationHolder;
@property (nonatomic,assign) int attempt;
@property (nonatomic,assign) int skipped;
@property (nonatomic,assign) int success;
@property (weak, nonatomic) NSTimer *puzzleTimer;
@property int timeInSeconds;
@property (nonatomic,assign) int assignedNumber1;
@property (nonatomic,assign) int assignedNumber2;
@property (nonatomic,assign) int assignedNumber3;
@property (nonatomic,assign) int assignedNumber4;
@property Boolean isAssigned;
@property (strong, nonatomic)gameModel* model;

@end

