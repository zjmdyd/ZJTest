//
//  ViewController.m
//  ZJTest
//
//  Created by issuser on 2022/3/24.
//

#import "ViewController.h"
#import <ZipArchive/ZipArchive.h>
#import <SSZipArchive/SSZipArchive.h>

@interface ViewController ()

@property (nonatomic, assign) BOOL completionAnimation;
@property (nonatomic, assign) BOOL hasAnotherAnimation;
@property (nonatomic, strong) UIImageView *iv;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [self test1];
}

- (void)test0 {
    ZipArchive *archive = [ZipArchive new];
    NSString *zipPath = @"";
    [archive UnzipOpenFile:zipPath];
}

- (void)test1 {
    NSString *zipPath = [[NSBundle mainBundle] pathForResource:@"cat" ofType:@"zip"];
    [SSZipArchive unzipFileAtPath:zipPath toDestination:@"/Users/issuser/Desktop/unzip_cat"];
}

- (void)test2 {
    self.iv.hidden = NO;
    self.hasAnotherAnimation = YES; // 是否有新动画
    self.completionAnimation = NO;  // 是否完成动画
    
    [UIView animateWithDuration:10 animations:^{
        self.hasAnotherAnimation = NO;
    } completion:^(BOOL finished) {
        self.completionAnimation = YES;
        if (!self.hasAnotherAnimation && self.completionAnimation) {
            self.iv.hidden = YES;
        }
    }];
}

@end
