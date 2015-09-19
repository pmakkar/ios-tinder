//
//  ProfileViewController.m
//  Tinder
//
//  Created by Puneet Makkar on 9/18/15.
//  Copyright © 2015 Puneet Makkar. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapRecognizer;
@end;

@implementation ProfileViewController

-(id) initWithSender:(UINavigationController*)sender
{
    self=[sender.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    if (self) {
        //custom initialisation
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UITapGestureRecognizer *tapRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageTap:)];
    
    [self.view addGestureRecognizer:tapRecognizer];
}

- (IBAction)onImageTap:(UITapGestureRecognizer *)sender {
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
