//
//  AssignNumberViewController.m
//  TestApp
//
//  Created by admin on 5/3/18.
//  Copyright © 2018 Siddheshwar Narke. All rights reserved.
//

#import "AssignNumberViewController.h"
#import "ViewController.h"

@interface AssignNumberViewController ()

@end

@implementation AssignNumberViewController
 NSArray *numPickerData;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // Initialize Data
    numPickerData = @[@"1", @"2", @"3", @"4", @"5", @"6",@"7",@"8",@"9"];
    self.numPicker1.dataSource =self;
    self.numPicker1.delegate =self;
    
    self.numPicker2.dataSource =self;
    self.numPicker2.delegate =self;
    
    self.numPicker3.dataSource =self;
    self.numPicker3.delegate =self;
    
    self.numPicker4.dataSource =self;
    self.numPicker4.delegate =self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
// The number of columns of data
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}
// The number of rows of data
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return numPickerData.count;
}
// The data to return for the row and component (column) that's being passed in
- (NSString*)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    return numPickerData[row];
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"mainViewSegue"]) {
    // Get the new view controller using
    ViewController *vController = [segue destinationViewController];
        vController.isAssigned =false;
    //[[vController assignedNumber] addObject:@"Mani"];
    // Pass the selected object to the new view controller.
    }
    if ([segue.identifier isEqualToString:@"assignSegue"]) {
        // Get the new view controller using
        ViewController *vController = [segue destinationViewController];
        
        vController.isAssigned =true;
        // Pass the selected object to the new view controller.
        
        NSInteger row;
        row = [_numPicker1 selectedRowInComponent:0];
        vController.assignedNumber1=[[numPickerData objectAtIndex:row]intValue];
        NSLog(@"The concatenated string is %@", [numPickerData objectAtIndex:row]);
        row = [_numPicker2 selectedRowInComponent:0];
        vController.assignedNumber2=[[numPickerData objectAtIndex:row]intValue];
        row = [_numPicker3 selectedRowInComponent:0];
        vController.assignedNumber3=[[numPickerData objectAtIndex:row]intValue];
        row = [_numPicker4 selectedRowInComponent:0];
        vController.assignedNumber4=[[numPickerData objectAtIndex:row]intValue];
    }
}

@end
