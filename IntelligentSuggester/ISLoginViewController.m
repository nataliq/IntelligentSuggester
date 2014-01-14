//
//  ISLoginViewController.m
//  IntelligentSuggester
//
//  Created by Siyana Slavova on 1/14/14.
//  Copyright (c) 2014 Siyana Slavova. All rights reserved.
//

#import "ISLoginViewController.h"
#import "FSOAuth.h"
#import "Constants.h"

@interface ISLoginViewController ()

@end

@implementation ISLoginViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)foursquareConnect:(UIButton *)sender {
    FSOAuthStatusCode statusCode = [FSOAuth authorizeUserUsingClientId:FSO_CLIENT_ID
                                                     callbackURIString:FSO_CALLBACK
                                                  allowShowingAppStore:YES];
    
    NSString *resultText = nil;
    
    switch (statusCode) {
        case FSOAuthStatusSuccess:
            // do nothing
            break;
        case FSOAuthStatusErrorInvalidCallback: {
            resultText = @"Invalid callback URI";
            break;
        }
        case FSOAuthStatusErrorFoursquareNotInstalled: {
            resultText = @"Foursquare not installed";
            break;
        }
        case FSOAuthStatusErrorInvalidClientID: {
            resultText = @"Invalid client id";
            break;
        }
        case FSOAuthStatusErrorFoursquareOAuthNotSupported: {
            resultText = @"Installed FSQ app does not support oauth";
            break;
        }
        default: {
            resultText = @"Unknown status code returned";
            break;
        }
    }
    NSLog(@"%@",resultText);
    
}


@end
