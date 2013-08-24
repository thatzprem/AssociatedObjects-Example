//
//  ViewController.m
//  AssociatedObjects
//
//  Created by Prem kumar on 22/07/13.
//  Copyright (c) 2013 Prem kumar. All rights reserved.
//

#import "ViewController.h"
#import <objc/runtime.h>


@interface ViewController ()

@end

const char associatedKey;
@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //Create an alert view object
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"INFO" message:@"Test AlertView One" delegate:self cancelButtonTitle:@"Ok" otherButtonTitles:nil];
    [alertView show];
    
    //Create a string object.
    NSString *string = @"Test String One";

    /**
     Associate alertView object with a key and value.
     Object = alertViewOne;
     Key = associatedKey;
     Value = stringOne;
     Association policy = OBJC_ASSOCIATION_RETAIN_NONATOMIC
     */
    objc_setAssociatedObject(alertView, &associatedKey, string, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
    
}

-(void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    
    /**
     Get the value associated with the object by specifying the key.
     Object = alertView;
     Key = associatedKey;
    */
    id returnedAssociatedObjectValue = objc_getAssociatedObject(alertView, &associatedKey);
    
    //Check if the key has value
    if (returnedAssociatedObjectValue != nil) {
        //Check if the key has rerurned a string value that was assiciated in viewDidLoad
        if ([returnedAssociatedObjectValue isKindOfClass:[NSString class]]) {
            NSLog(@"The object has returned the associated string value: %@",returnedAssociatedObjectValue);
        }
    }
    else
        NSLog(@"Error retreiving the associated object");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
