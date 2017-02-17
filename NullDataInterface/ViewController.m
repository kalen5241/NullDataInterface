//
//  ViewController.m
//  NullDataInterface
//
//  Created by 冯旭 on 16/02/2017.
//  Copyright © 2017 冯旭. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TowViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSArray * dataArray;
@end


static NSString *identifier = @"NullCell";
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _dataArray = @[@"默认现实", @"自定义显示图片", @"自定义显示图片和文字", @"自定义显示图片和文字和按钮"];
    self.NullDataTableView.delegate = self;
    self.NullDataTableView.dataSource = self;
    self.isEmptyDataPage = NO;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = self.dataArray[indexPath.row];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.row == 0) {
        OneViewController * one = [[OneViewController alloc]init];
        [self.navigationController pushViewController:one animated:YES];
    }else if (indexPath.row == 1) {
        TowViewController * two = [[TowViewController alloc]init];
        [self.navigationController pushViewController:two animated:YES];
    }else if (indexPath.row == 2) {
        ThreeViewController * three = [[ThreeViewController alloc]init];
        [self.navigationController pushViewController:three animated:YES];
    }else if (indexPath.row == 3) {
        FourViewController * four = [[FourViewController alloc]init];
        [self.navigationController pushViewController:four animated:YES];
    }
}








- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
