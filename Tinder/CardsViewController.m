//
//  CardsViewController.m
//  Tinder
//
//  Created by Puneet Makkar on 9/18/15.
//  Copyright © 2015 Puneet Makkar. All rights reserved.
//

#import "CardsViewController.h"
#import "ProfileViewController.h"

@interface CardsViewController ()
@property (strong, nonatomic) IBOutlet UIPanGestureRecognizer *panGestureRecognizer;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (IBAction)onImageMove:(UIPanGestureRecognizer *)sender;
@property (strong, nonatomic) IBOutlet UITapGestureRecognizer *tapGestureRecognizer;
- (IBAction)onImageTap:(UITapGestureRecognizer *)sender;
@property CGPoint cardInitialCenter;
@end

@implementation CardsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    
    UIPanGestureRecognizer *panGestureRecognizer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(onImageMove:)];
    
    [self.view addGestureRecognizer:panGestureRecognizer];
    
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(onImageTap:)];
    
    [self.view addGestureRecognizer:tapGestureRecognizer];
    
    //to load the xib
    //[[UINib nibWithNibName:@"name" bundle:nil] instantiateWithOwner:self options:nil];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)onImageMove:(UIPanGestureRecognizer *)sender {
    
    CGPoint translation = [sender translationInView:self.view];
    //CGPoint velocity = [sender velocityInView:self.view];
    
    NSLog(@"trayview x is: %f", translation.x);
    NSLog(@"trayview y is: %f", translation.y);
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateBegan) {
        NSLog(@"Panning Started");
        self.cardInitialCenter = self.myImageView.center;
    }
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateChanged) {
        NSLog(@"Panning");
        self.myImageView.center = CGPointMake(self.cardInitialCenter.x +translation.x, self.cardInitialCenter.y + translation.y);
    }
    
    if ([(UIPanGestureRecognizer*)sender state] == UIGestureRecognizerStateEnded) {
        NSLog(@"Panning Ended");
    }
}

- (IBAction)onImageTap:(UITapGestureRecognizer *)sender {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle: nil];
    ProfileViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    [self.navigationController pushViewController:viewController animated:YES];
}

@end
