//
//  OneViewController.m
//  NullDataInterface
//
//  Created by 冯旭 on 16/02/2017.
//  Copyright © 2017 冯旭. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) NSMutableArray * dataArr;

@end

@implementation OneViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _dataArr = [NSMutableArray array];
    //当这行代码打开时 就不会提示没网了
//    [_dataArr addObject:@"fx"];
    
    self.NullDataTableView.dataSource = self;
    self.NullDataTableView.delegate = self;
    self.emptyPageImage = @"seat";
    self.emptyPageTitle = @"当前网络不好 请重试！";
    self.emptyPageSubtitle = @"冯旭， 世界上最遥远的距离 莫过于没网！";
}




- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *identifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    return cell;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataArr.count;
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

@end
