#import "ViewController.h"
#import "MakeNumber24.h"


@interface ViewController()
@end

@implementation ViewController



- (IBAction)pressNumber1:(UIButton*)sender {
    [_doneButton setEnabled:true];
    
    NSObject * obj =  [_equationHolder lastObject];
    NSScanner *scanner = [NSScanner scannerWithString:[obj description]];
    BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
    if(!isNumeric)
    {
    
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
}
- (IBAction)pressSign:(UIButton*)sender {
    [_doneButton setEnabled:true];
    
    [_equationHolder addObject:sender.titleLabel.text];
   
    NSMutableString * currentEq = [[NSMutableString alloc] init];
    for (NSObject * obj in _equationHolder)
    {
        [currentEq appendString:[obj description]];
    }
    [_equationHolderLabel setText:currentEq];
    
}
-(void)disableButton:(int) buttonText{
    int n1 = [ [_Number1 titleForState:UIControlStateNormal] intValue];
    if(n1 == buttonText)
    {
        [_Number1 setEnabled:true];
    }
    int n2 = [ [_Number2 titleForState:UIControlStateNormal] intValue];
    if(n2 == buttonText)
    {
        [_Number2 setEnabled:true];
    }
    int n3 = [ [_Number3 titleForState:UIControlStateNormal] intValue];
    if(n3 == buttonText)
    {
        [_Number3 setEnabled:true];
    }
    int n4 = [ [_Number4 titleForState:UIControlStateNormal] intValue];
    if(n4 == buttonText)
    {
        [_Number4 setEnabled:true];
    }
    
}
- (IBAction)backspaceHandler:(UIButton*)sender {
    
    if([_equationHolder count]>0)
    {
        NSObject * obj =  [_equationHolder lastObject];
        NSScanner *scanner = [NSScanner scannerWithString:[obj description]];
        BOOL isNumeric = [scanner scanInteger:NULL] && [scanner isAtEnd];
        if(isNumeric)
        {
            int currentNumber =  [[obj description] intValue];
            [self disableButton:currentNumber];
        }
        
        
        [_equationHolder removeLastObject];
    }
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
        [_doneButton setEnabled:false];
    }
        
    
}
-(void)showSloutionDialog:(NSString*)infoMessage{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Solution"
                                message:infoMessage
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
- (IBAction)Clear:(id)sender {
    [_equationHolderLabel setText:@""];
    [_doneButton setEnabled:false];
    while([_equationHolder count]>0)
        [_equationHolder removeLastObject];
    [_Number1 setEnabled:true];
    [_Number2 setEnabled:true];
    [_Number3 setEnabled:true];
    [_Number4 setEnabled:true];
}
- (IBAction)Skip:(id)sender {
    _skipped = _skipped + 1;
    [_skippedLabel setText:[NSString stringWithFormat:@"%d",_skipped ]];
    [self Clear:nil];
     [self generateRandomNumbers];
   
}
- (IBAction)ShowSolution:(id)sender {
   
    
    _skipped = _skipped + 1;
    [_skippedLabel setText:[NSString stringWithFormat:@"%d",_skipped ]];
    [self generateRandomNumbers];
    // get solution
    NSString *solution =@"Sorry,No Solutions exists";
    Boolean isSolution =[MakeNumber24 hasSolution:[_Number1.titleLabel.text intValue] :[_Number2.titleLabel.text intValue] :[_Number3.titleLabel.text intValue] :[_Number4.titleLabel.text intValue]];
    if(isSolution)
    {
        solution = [MakeNumber24 getSolution:[_Number1.titleLabel.text intValue] :[_Number2.titleLabel.text intValue] :[_Number3.titleLabel.text intValue] :[_Number4.titleLabel.text intValue]];
        [self showSloutionDialog:solution];
    }
    else
        [self showSloutionDialog:solution];
        
        
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // set tags for button
    _Number1.tag = 15;
    _Number2.tag = 16;
    _Number3.tag = 17;
    _Number4.tag = 18;
    //_isAssigned = false;
    
    _model = [gameModel getInstance];
    [_doneButton setEnabled:false];
    _equationHolder = [[NSMutableArray alloc]init];
    
    [self loadValues];
    /*_skipped = 0;
    _attempt =0;
    _success = 0;*/
    [_successLabel setText:[NSString stringWithFormat:@"%d",_success ]];
    [_skippedLabel setText:[NSString stringWithFormat:@"%d",_skipped ]];
    [_attemptLabel setText:[NSString stringWithFormat:@"%d",_attempt ]];
    
    
   // _assignedNumber = [[NSMutableArray alloc]init];
    
    if(_isAssigned)
    {
        [self setAssignedNumbers];
        _isAssigned = false;
    }
    else
        [self generateRandomNumbers];
    //assign numbers
    
    [self Clear:NULL];
    _timeInSeconds=0;
    _puzzleTimer = [self createTimer];
    
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)loadValues{
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *key = @"success";
    
    if ([preferences objectForKey:key] == nil)
    {
        _success =0;
        NSLog(@"The stored value is %d", _success);
    }
    else
    {
        //  Get current level
        _success = [preferences integerForKey:key];
        NSLog(@"The stored value is %d", _success);
    }
    
    NSString *key1 = @"attempt";
    
    if ([preferences objectForKey:key1] == nil)
    {
        _attempt =0;
    }
    else
    {
        //  Get current level
         _attempt= [preferences integerForKey:key1];
    }
    
    NSString *key3 = @"skipped";
    
    if ([preferences objectForKey:key3] == nil)
    {
        _skipped =0;
    }
    else
    {
        //  Get current level
        _skipped = [preferences integerForKey:key];
    }
    
}
- (IBAction)evaluateGameAttempt:(id)sender {
    
    
    NSExpression *expression = [NSExpression expressionWithFormat:_equationHolderLabel.text];
    NSNumber *result = [expression expressionValueWithObject:nil context:nil];
    int number = [result intValue];
    if(number == 24)
    {
        _success =_success + 1;
        [_successLabel setText:[NSString stringWithFormat:@"%d",_success ]];
        NSString *succesString = [NSString stringWithFormat:@"%@",_equationHolderLabel.text ];
        [self showSuccessDialog:succesString];
        [self Clear:nil];
        [self generateRandomNumbers];
    }
    else{
        _attempt =_attempt +1;
        [_attemptLabel setText:[NSString stringWithFormat:@"%d",_attempt ]];
        [self showErrorDialog:@"Incorrect Solution.PleaseTry again"];
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
    n1=0;n2=0;n3=0;n4=0;
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
        hasSolution = [MakeNumber24 hasSolution:n1 :n2 :n3 :n4];
    }
    [self assignNumbers:n1 Number2:n2 Number3:n3 Number4:n4];
}
- (NSTimer *)createTimer {
    return [NSTimer scheduledTimerWithTimeInterval:1.0
                                            target:self
                                          selector:@selector(clickedTimer:)
                                          userInfo:nil
                                           repeats:YES];
}

-(void)showSuccessDialog:(NSString*)infoMessage{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Success"
                                message:[NSString stringWithFormat:@"Binggo! %@ =24",infoMessage]
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {[self setNextPuzzle];}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}
-(void)showErrorDialog:(NSString*)infoMessage{
    UIAlertController* alert = [UIAlertController
                                alertControllerWithTitle:@"Failure"
                                message:infoMessage
                                preferredStyle:UIAlertControllerStyleAlert];
    
    UIAlertAction* defaultAction = [UIAlertAction
                                    actionWithTitle:@"OK" style:UIAlertActionStyleDefault
                                    handler:^(UIAlertAction *action) {}];
    
    [alert addAction:defaultAction];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)setNextPuzzle{
    
}
- (void)clickedTimer:(NSTimer *)timer {
    
    _timeInSeconds++;
    [_timeLabel setText:[self getTime:_timeInSeconds]];
    
}
- (NSString *)getTime:(int)tSeconds
{
    
    int s = tSeconds % 60;
    int m = (tSeconds / 60) % 60;
    int h = tSeconds / 3600;
    
    return [NSString stringWithFormat:@"%d:%d:%d",h, m, s];
}
-(void)setAssignedNumbers{
    
        [_Number1 setTitle:[NSString stringWithFormat:@"%d",_assignedNumber1]forState:UIControlStateNormal];
        
        [_Number2 setTitle:[NSString stringWithFormat:@"%d",_assignedNumber2] forState:UIControlStateNormal];
        [_Number3 setTitle:[NSString stringWithFormat:@"%d",_assignedNumber3] forState:UIControlStateNormal];
        [_Number4 setTitle:[NSString stringWithFormat:@"%d",_assignedNumber4]  forState:UIControlStateNormal];
    
    
}
- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:(BOOL)animated];    // Call the super class implementation.
    // Usually calling super class implementation is done before self class implementation, but it's up to your application.
    
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *key = @"success";
    
    [preferences setInteger:_success forKey:key];
    NSString *key1 = @"attempt";
    
    [preferences setInteger:_attempt forKey:key1];
    NSString *key2 = @"skipped";
    
    [preferences setInteger:_skipped forKey:key2];
    
    //  Save
    const BOOL didSave = [preferences synchronize];
    
    if (!didSave)
    {
    NSLog(@"The values didnt save");
    }
}
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSUserDefaults *preferences = [NSUserDefaults standardUserDefaults];
    
    NSString *key = @"success";
    
    [preferences setInteger:_success forKey:key];
    NSString *key1 = @"attempt";
    
    [preferences setInteger:_attempt forKey:key1];
    NSString *key2 = @"skipped";
    
    [preferences setInteger:_skipped forKey:key2];
    
    //  Save
    const BOOL didSave = [preferences synchronize];
    
    if (!didSave)
    {
        NSLog(@"The values didnt save");
    }
    NSLog(@"prepared for segue");
}
@end
