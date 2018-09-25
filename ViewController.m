//
//  ViewController.m
//  sharks can fly
//
//  Created by Fsy on 2018/9/16.
//  Copyright © 2018年 Fsy. All rights reserved.
//

#import "ViewController.h"
#import "SVProgressHUD.h"
#import "AFNetworking.h"
#import "Masonry.h"
#import "MBProgressHUD.h"
#import <CommonCrypto/CommonDigest.h>
#import "GNetworking.h"
#import "NetworkType.h"
#import "MJURLRequestSerializer.h"

@interface ViewController ()<UIWebViewDelegate>
@property (nonatomic, strong) UIImageView *backImv;
@property (nonatomic, strong) UIWebView *showView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupFirst];
    [self setupUI];
}


- (void)setupFirst {
    
    GNetworking *n = [[GNetworking alloc] init];
    [n postCurrentNetWorkStatusController:self andsendHttpNetworkingBackAppID:@"0" andIPAddress:@"1" buildStr:@"1" bundleIdentifierStr:@"com.garfieshakejumpinterestQuickBoy.www"];
}


- (void)setupUI {
    
    MBProgressHUD *mb = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
    mb.mode = MBProgressHUDModeAnnularDeterminate;
    mb.label.text = @"Loading";
    
    [self setupShowView];
}


- (void)setupShowView {
    
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.showView];

    
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view);
        make.left.right.bottom.equalTo(self.view);
    }];

    
    [self.showView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://h5.yx8.cn/game/shuijingduidie/"]]];
    
    self.backImv = [[UIImageView alloc] initWithFrame:self.view.bounds];
    [self.view addSubview:self.backImv];
    [self.backImv setImage:[UIImage imageNamed:@"640-1136"]];
}


- (BOOL)prefersStatusBarHidden
{
    return YES;
}



- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType {
    
    return YES;
}


- (void)webViewDidStartLoad:(UIWebView *)webView {
    [MBProgressHUD showHUDAddedTo:self.view animated:YES];
}



- (void)webViewDidFinishLoad:(UIWebView *)webView {
    
    [self.backImv removeFromSuperview];
    [MBProgressHUD hideHUDForView:self.view animated:YES];
}


- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error {
    
    [SVProgressHUD showErrorWithStatus:@"Network not connected"];
}


- (UIWebView *)showView {
    
    if (_showView == nil) {

        _showView = [[UIWebView alloc] init];
        _showView.delegate = self;
        _showView.scrollView.scrollEnabled = NO;
        _showView.backgroundColor = [UIColor blackColor];
    }
    
    return _showView;
}

@end
