//
//  ViewController.m
//  TestApp
//
//  Created by Siddheshwar Narke on 4/29/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import "ViewController.h"
#import "MakeNumber.h"

@interface ViewController ()

@end

@implementation ViewController

- (IBAction)pressNumber1:(UIButton*)sender {
    
    [_equationHolder addObject:sender.titleLabel.text];
    if(sender.tag == 15 || sender.tag == 16 || sender.tag == 17 || sender.tag == 18)
    {
        [sender setEnabled:false];
        NSMutableString * currentEq = [[NSMutableString alloc] init];
        for (NSObject * obj in _equationHolder)
        {
            [currentEq appendString:[obj description]];
        }
        [_equationHolderLabel setText:currentEq];
    }
    
}
- (IBAction)pressSign:(UIButton*)sender {
    
    [_equationHolder addObject:sender.titleLabel.text];
   
    NSMutableString * currentEq = [[NSMutableString alloc] init];
    for (NSObject * obj in _equationHolder)
    {
        [currentEq appendString:[obj description]];
    }
    [_equationHolderLabel setText:currentEq];
    
}
- (IBAction)backspaceHandler:(UIButton*)sender {
    
    if([_equationHolder count]>0)
        [_equationHolder removeLastObject];
    if([_equationHolder count]>0){
    NSMutableString * currentEq = [[NSMutableString alloc] init];
        for (NSObject * obj in _equationHolder)
        {
            [currentEq appendString:[obj description]];
        }
        [_equationHolderLabel setText:currentEq];
        NSLog(@"The concatenated string is %@", currentEq);
    }
    else{
        [_equationHolderLabel setText:@""];
    }
        
    
}
- (IBAction)clearEquationHandler:(UIButton*)sender {
   
    [_equationHolderLabel setText:@""];

    while([_equationHolder count]>0)
        [_equationHolder removeLastObject];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // set tags for button
    _Number1.tag = 15;
    _Number2.tag = 16;
    _Number3.tag = 17;
    _Number4.tag = 18;
    
    
    
    _equationHolder = [[NSMutableArray alloc]init];
    _skipped = 0;
    _attempt = 0;
    _success = 0;
    [_successLabel setText:[NSString stringWithFormat:@"%d",_success ]];
    [_skippedLabel setText:[NSString stringWithFormat:@"%d",_skipped ]];
    [_attemptLabel setText:[NSString stringWithFormat:@"%d",_attempt ]];
    
    //assign numbers
    [self generateRandomNumbers];
    [self clearEquationHandler:NULL];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)evaluateGameAttempt:(id)sender {
    
    
    NSExpression *expression = [NSExpression expressionWithFormat:_equationHolderLabel.text];
    NSNumber *result = [expression expressionValueWithObject:nil context:nil];
    int number = [result intValue];
    if(number == 24)
    {
        _success =_success + 1;
        [_successLabel setText:[NSString stringWithFormat:@"%d",_success ]];
    }
}
- (void)assignNumbers:(int) num1 Number2:(int)num2 Number3:(int)num3 Number4:(int)num4{
    
    [_Number1 setTitle: [NSString stringWithFormat:@"%d",num1 ] forState:UIControlStateNormal];
    [_Number2 setTitle: [NSString stringWithFormat:@"%d",num2] forState:UIControlStateNormal];
    [_Number3 setTitle: [NSString stringWithFormat:@"%d",num3 ] forState:UIControlStateNormal];
    [_Number4 setTitle: [NSString stringWithFormat:@"%d",num4 ] forState:UIControlStateNormal];
}
-(void)generateRandomNumbers{
    bool hasSolution = false;
    int n1,n2,n3,n4;
    while(!hasSolution){
        n1 = arc4random_uniform(9);
        if(n1 == 0)
            n1=1;
        n2 = arc4random_uniform(9);
        if(n2 == 0)
            n2=1;
        n3 = arc4random_uniform(9);
        if(n3 == 0)
            n3=1;
        n4 = arc4random_uniform(9);
        if(n4 == 0)
            n4=1;
        hasSolution = [MakeNumber isValidSolution];
    }
    [self assignNumbers:n1 Number2:n2 Number3:n3 Number4:n4];
}
-(void)onSuccessReset{
    
}
@end
