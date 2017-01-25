//
//  ViewController.m
//  QuicksortTask
//
//  Created by Naresh Kandala on 12/12/16.
//  Copyright © 2016 Naresh Kandala. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray * arr_Names = [NSMutableArray new];
    
    arr_Names = [NSMutableArray arrayWithObjects:@"Raj",@"Simran",@"Vinod", nil]; // Adding Names
    
    //Adding Markss

    NSArray *arr_mrks1 = [NSArray arrayWithObjects:@80, @50, @40, nil];
    NSArray *arr_mrks2 = [NSArray arrayWithObjects:@50, @50, @40, nil];
    NSArray *arr_mrks3 = [NSArray arrayWithObjects:@40, @50, @40, nil];
    
    NSDictionary *dict_marks = [NSMutableDictionary new];
    
    NSMutableArray *arr_objects = [NSMutableArray new];
    
    [arr_objects addObject:arr_mrks1];
    [arr_objects addObject:arr_mrks2];
    [arr_objects addObject:arr_mrks3];
    
    
    //Sum of marks by names
    
    dict_marks = [NSDictionary dictionaryWithObjects:arr_objects forKeys:arr_Names];
    NSDictionary *Total_Dict = [NSDictionary new];
    NSMutableArray *arr_total = [NSMutableArray new];
    
    for (int k =0; k<dict_marks.count; k++) {
        
        NSArray *arra= [dict_marks objectForKey:[arr_Names objectAtIndex:k]];
        
        NSInteger sum = 0;
        for (NSNumber *num in arra)
        {
            sum += [num intValue];
        }
        
        [arr_total addObject:[NSNumber numberWithInteger:sum]];
        
    }
    
    //Sorting sum r
    
    Total_Dict = [NSDictionary dictionaryWithObjects:arr_total forKeys:arr_Names];
    
    
    NSArray *sorted = [[Total_Dict allValues] sortedArrayUsingDescriptors:@[[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO]]];
    NSMutableArray *arr_final_names = [NSMutableArray new];
    for (int n = 0; n<[sorted count]; n++) {
        
        NSNumber *number = [sorted objectAtIndex:n];
        for (int k = 0; k<[Total_Dict count]; k++) {
            
            NSNumber *to_number = [Total_Dict objectForKey:[arr_Names objectAtIndex:k]];
            
            if ([number isEqual:to_number]) {
                
                
                [arr_final_names addObject:[arr_Names objectAtIndex:k]];
                
            }
            
            
        }
        
    }
    
 //Creating Table names and displaying sorted valus
    
    printf(" | %-5s|  %-8s| %-8s| %-5s| %-7s | %-10s|\n", "Rank", "Name", "English", "Math", "Science", "Total Marks");
    
    printf(" ----------------------------------------------------------");
    for (int i = 0; i<[arr_Names count]; i++) {
        printf("\n");
        NSString *str = [arr_final_names objectAtIndex:i];
        NSArray *arr_nameby = [dict_marks objectForKey:str];
        
        printf(" | %-5d| %-8s | %-8ld| %-5ld| %-8ld| %-10ld|",i+1,[str cStringUsingEncoding:NSUTF8StringEncoding],(long)[[arr_nameby objectAtIndex:0] integerValue],(long)[[arr_nameby objectAtIndex:1] integerValue],(long)[[arr_nameby objectAtIndex:2] integerValue],[[Total_Dict objectForKey:str] integerValue]);
        
        
    }
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
