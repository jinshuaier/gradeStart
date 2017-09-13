//
//  ViewController.m
//  评论星星
//
//  Created by 胡高广 on 2017/9/13.
//  Copyright © 2017年 jinshuaier. All rights reserved.
//

#import "ViewController.h"
#import "XHStarRateView.h"
#import "WSStarRatingView.h"

@interface ViewController ()<XHStarRateViewDelegate,StarRatingViewDelegate>

@property (nonatomic, assign) float scoreStr; //商品评分
@property (nonatomic, assign) float serviceScore;//服务评分

@end

@implementation ViewController
{
    UILabel *scoreLabel;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"不可滑动";
    label.textColor = [UIColor blackColor];
    label.frame = CGRectMake(0, 100, self.view.frame.size.width, 15);
    label.font = [UIFont systemFontOfSize:15];
    label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label];
    
    XHStarRateView *starRateView3 = [[XHStarRateView alloc] initWithFrame:CGRectMake(102, CGRectGetMaxY(label.frame) + 20, 178, 23) finish:^(CGFloat currentScore) {
        NSLog(@"商品 %f",currentScore);
        
    }];
    //默认的星评
    starRateView3.currentScore = 3;
    
    [self.view addSubview:starRateView3];
    
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"可滑动";
    label1.textColor = [UIColor blackColor];
    label1.frame = CGRectMake(0, CGRectGetMaxY(starRateView3.frame) + 40, self.view.frame.size.width, 15);
    label1.font = [UIFont systemFontOfSize:15];
    label1.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:label1];
    
    
    scoreLabel = [[UILabel alloc]initWithFrame:CGRectMake(30, CGRectGetMaxY(label1.frame) + 20, self.view.frame.size.width-60, 25)];
    scoreLabel.textAlignment = NSTextAlignmentCenter;
    scoreLabel.textColor = [UIColor lightGrayColor];
    scoreLabel.font =  [UIFont systemFontOfSize:20];
    [self.view addSubview:scoreLabel];
    

    WSStarRatingView *starRatingView = [[WSStarRatingView alloc] initWithFrame:CGRectMake(30, CGRectGetMaxY(scoreLabel.frame) + 20, self.view.frame.size.width-60, 50) numberOfStar:5];
    starRatingView.delegate = self;
    [self.view addSubview:starRatingView];
    
    [starRatingView setScore:0.5 withAnimation:YES completion:^(BOOL finished) {
        scoreLabel.text = [NSString stringWithFormat:@"%0.1f分",0.5 * 5 ];
    }];

    // s any additional setup after loading the view, typically from a nib.
}

- (void)starRatingView:(WSStarRatingView *)view score:(float)score
{
    scoreLabel.text = [NSString stringWithFormat:@"%0.1f分",score * 5 ];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
