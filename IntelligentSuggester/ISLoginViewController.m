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
#import <FacebookSDK/FacebookSDK.h>

@interface ISLoginViewController () <FBLoginViewDelegate>

@property (weak, nonatomic) IBOutlet FBLoginView *fbLoginView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet FBProfilePictureView *profilePictureView;


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
    self.fbLoginView.delegate = self;
#warning Set read permissions
    //self.fbLoginView.readPermissions = @[@"basic_info", @"email", @"user_likes"];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - FBLoginViewDelegate methods

-(void)loginView:(FBLoginView *)loginView handleError:(NSError *)error
{
    
}

-(void)loginViewFetchedUserInfo:(FBLoginView *)loginView user:(id<FBGraphUser>)user
{
    //Return user data
    
    //From FBProfilePictureView
    self.profilePictureView.profileID = user.id;
    self.userNameLabel.text = user.name;
}

-(void)loginViewShowingLoggedInUser:(FBLoginView *)loginView
{
    
    FBAccessTokenData *fbTokenData = [[FBSession activeSession] accessTokenData];
    NSLog(@"%@", fbTokenData);
}

-(void)loginViewShowingLoggedOutUser:(FBLoginView *)loginView
{
    self.profilePictureView.profileID = @"";
    self.userNameLabel.text = @"";
    
}

#pragma mark - Foursquare Connection
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
