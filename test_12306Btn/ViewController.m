//
//  ViewController.m
//  test_12306Btn
//
//  Created by hc on 2017/2/4.
//  Copyright © 2017年 hc. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#define RGB(R,G,B)    [UIColor colorWithRed:R/255.0 green:G/255.0 blue:B/255.0 alpha:1.0]
#define kWindowH            [UIScreen mainScreen].bounds.size.height
#define kWindowW            [UIScreen mainScreen].bounds.size.width
@interface ViewController ()
@property (nonatomic,strong) UIButton *allBtn;
@property (nonatomic,strong) UIButton *GDCBtn;
@property (nonatomic,strong) UIButton *ZBtn;
@property (nonatomic,strong) UIButton *TBtn;
@property (nonatomic,strong) UIButton *KBtn;
@property (nonatomic,strong) UIButton *otherBtn;

@property (nonatomic,strong) NSArray *arr;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _arr = @[@"All",@"GDC",@"Z",@"T",@"K",@"Other"];
    
    _allBtn = [UIButton buttonWithType:0];
    [_allBtn setTitle:@"All" forState:UIControlStateNormal];
    [_allBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateHighlighted];
    [_allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_allBtn addTarget:self action:@selector(allBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_allBtn];
    [_allBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(15);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];
    
    _GDCBtn = [UIButton buttonWithType:0];
    [_GDCBtn setTitle:@"G/D/C" forState:UIControlStateNormal];
    [_GDCBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_GDCBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_GDCBtn addTarget:self action:@selector(GDCBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_GDCBtn];
    [_GDCBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_allBtn.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];
    
    _ZBtn = [UIButton buttonWithType:0];
    [_ZBtn setTitle:@"Z" forState:UIControlStateNormal];
    [_ZBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_ZBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_ZBtn addTarget:self action:@selector(ZBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_ZBtn];
    [_ZBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_GDCBtn.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];
    
    _TBtn = [UIButton buttonWithType:0];
    [_TBtn setTitle:@"T" forState:UIControlStateNormal];
    [_TBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_TBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_TBtn addTarget:self action:@selector(TBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_TBtn];
    [_TBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_ZBtn.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];
    
    _KBtn = [UIButton buttonWithType:0];
    [_KBtn setTitle:@"K" forState:UIControlStateNormal];
    [_KBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_KBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_KBtn addTarget:self action:@selector(KBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_KBtn];
    [_KBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_TBtn.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];

    
    _otherBtn = [UIButton buttonWithType:0];
    [_otherBtn setTitle:@"Other" forState:UIControlStateNormal];
    [_otherBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_otherBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [_otherBtn addTarget:self action:@selector(otherBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_otherBtn];
    [_otherBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(_KBtn.mas_right);
        make.height.mas_equalTo(30);
        make.width.mas_equalTo((kWindowW - 30)/6);
        make.top.mas_equalTo(100);
    }];
    
}
- (void)allBtnAction:(UIButton *)sender {
    
//    sender.selected = !sender.selected;
    
    _allBtn.selected = YES;
    
    if (sender.selected) {
        _allBtn.backgroundColor = [UIColor greenColor];
        //只有all选中时的字体颜色  <> ???
        [_allBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
        _GDCBtn.backgroundColor = [UIColor whiteColor];
        _ZBtn.backgroundColor = [UIColor whiteColor];
        _TBtn.backgroundColor = [UIColor whiteColor];
        _KBtn.backgroundColor = [UIColor whiteColor];
        _otherBtn.backgroundColor = [UIColor whiteColor];
        _GDCBtn.selected = NO;
        _ZBtn.selected = NO;
        _TBtn.selected = NO;
        _KBtn.selected = NO;
        _otherBtn.selected = NO;
    }
    
    //只有all btn 选中的时候，不允许非选中状态《》？？？？
    if (!sender.selected) {
//        _allBtn.backgroundColor = [UIColor whiteColor];
    }
  
    
    
}
- (void)GDCBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _GDCBtn.backgroundColor = [UIColor greenColor];
        _allBtn.selected = NO;
        _allBtn.backgroundColor = [UIColor whiteColor];
    }
    if (!sender.selected) {
        _GDCBtn.backgroundColor = [UIColor whiteColor];
    }
    
    //都不选中的状态
    if ((_otherBtn.selected == NO) && (_KBtn.selected == NO) && (_TBtn.selected == NO) && (_ZBtn.selected == NO) && (_GDCBtn.selected == NO)) {
        NSLog(@"1");
        _allBtn.selected = YES;
        _allBtn.backgroundColor = [UIColor greenColor];
    }

}
- (void)ZBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _ZBtn.backgroundColor = [UIColor greenColor];
        _allBtn.selected = NO;
        _allBtn.backgroundColor = [UIColor whiteColor];
    }
    if (!sender.selected) {
        _ZBtn.backgroundColor = [UIColor whiteColor];
    }
    
    //都不选中的状态
    if ((_otherBtn.selected == NO) && (_KBtn.selected == NO) && (_TBtn.selected == NO) && (_ZBtn.selected == NO) && (_GDCBtn.selected == NO)) {
        NSLog(@"2");
        _allBtn.selected = YES;
        _allBtn.backgroundColor = [UIColor greenColor];
    }

}
-(void)TBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _TBtn.backgroundColor = [UIColor greenColor];
        _allBtn.selected = NO;
        _allBtn.backgroundColor = [UIColor whiteColor];
    }
    if (!sender.selected) {
        _TBtn.backgroundColor = [UIColor whiteColor];
    }

    //都不选中的状态
    if ((_otherBtn.selected == NO) && (_KBtn.selected == NO) && (_TBtn.selected == NO) && (_ZBtn.selected == NO) && (_GDCBtn.selected == NO)) {
        NSLog(@"3");
        _allBtn.selected = YES;
        _allBtn.backgroundColor = [UIColor greenColor];
    }
}

- (void)KBtnAction:(UIButton*)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _KBtn.backgroundColor = [UIColor greenColor];
        _allBtn.selected = NO;
        _allBtn.backgroundColor = [UIColor whiteColor];
    }
    if (!sender.selected) {
        _KBtn.backgroundColor = [UIColor whiteColor];
    }
    
    //都不选中的状态
    if ((_otherBtn.selected == NO) && (_KBtn.selected == NO) && (_TBtn.selected == NO) && (_ZBtn.selected == NO) && (_GDCBtn.selected == NO)) {
        NSLog(@"4");
        _allBtn.selected = YES;
        _allBtn.backgroundColor = [UIColor greenColor];
    }
}
- (void)otherBtnAction:(UIButton *)sender {
    sender.selected = !sender.selected;
    if (sender.selected) {
        _otherBtn.backgroundColor = [UIColor greenColor];
        _allBtn.selected = NO;
        _allBtn.backgroundColor = [UIColor whiteColor];
    }
    if (!sender.selected) {
        _otherBtn.backgroundColor = [UIColor whiteColor];
    }
    
    
    //都不选中的状态
    if ((_otherBtn.selected == NO) && (_KBtn.selected == NO) && (_TBtn.selected == NO) && (_ZBtn.selected == NO) && (_GDCBtn.selected == NO)) {
        NSLog(@"5");
        _allBtn.selected = YES;
        _allBtn.backgroundColor = [UIColor greenColor];
    }
    
    
    
    
}
@end
