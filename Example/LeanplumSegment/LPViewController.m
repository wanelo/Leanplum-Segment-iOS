//
//  LPViewController.m
//  Leanplum Segment iOS Integration Version 1.0.1
//
//  Copyright (c) 2016 Leanplum. All rights reserved.
//

#import "LPViewController.h"
#import <Leanplum/Leanplum.h>
#import <LeanplumSegment/SEGLeanplumIntegrationFactory.h>

@interface LPViewController ()

@end

@implementation LPViewController

NSString *const SEGMENT_WRITE_KEY = @"NX0nsyR11lQr1lB0QIzabRVqSVkVAaxy";

- (void)viewDidLoad
{
    [super viewDidLoad];

    SEGAnalyticsConfiguration *config =
        [SEGAnalyticsConfiguration configurationWithWriteKey:SEGMENT_WRITE_KEY];
    [config use:[SEGLeanplumIntegrationFactory instance]];
    [SEGAnalytics setupWithConfiguration:config];

    [[SEGAnalytics sharedAnalytics] identify:nil
                                      traits:@{
                                          @"name" : @"Anonymous user"
                                      }];

    [self performSelector:@selector(login) withObject:nil afterDelay:3.f];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)trackButtonClicked:(id)sender
{
    [[SEGAnalytics sharedAnalytics] track:@"Track Button Clicked!"
                               properties:@{
                                   @"price" : @(0.99),
                                   @"currency" : @"USD",
                                   @"title" : @"InApp Purchase"
                               }];
}

- (void)login
{
    // Simulate a login, where after users e-mail adress is known.
    [[SEGAnalytics sharedAnalytics]
        identify:@"3"
          traits:@{
              @"name" : @"John Doe",
              @"email" : @"john.doe2@gmail.com"
          }];
}

@end
