//
//  BaseNullTableViewHandle.m
//  NullDataInterface
//
//  Created by 冯旭 on 16/02/2017.
//  Copyright © 2017 冯旭. All rights reserved.
//

#import "BaseNullTableViewHandle.h"
#import "UIScrollView+EmptyDataSet.h"

@interface BaseNullTableViewHandle () <DZNEmptyDataSetSource, DZNEmptyDataSetDelegate>

@end

@implementation BaseNullTableViewHandle

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.isEmptyDataPage = YES;
    [self.view addSubview:self.NullDataTableView];
}

#pragma mark - Layz
- (UITableView *)NullDataTableView {
    if (_NullDataTableView == nil) {
        
        _NullDataTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, [[UIScreen mainScreen] bounds].size.height) style:UITableViewStylePlain];
        _NullDataTableView.tableFooterView = [[UIView alloc] init];
        _NullDataTableView.emptyDataSetSource = self;
        _NullDataTableView.emptyDataSetDelegate = self;
    }
    return _NullDataTableView;
}


#pragma mark - DZNEmptyDataSetSource & DZNEmptyDataSetDelegate

-(UIImage *)imageForEmptyDataSet:(UIScrollView *)scrollView {
    if (self.emptyPageImage) {
        return [UIImage imageNamed:self.emptyPageImage];
    }
    return [UIImage imageNamed:@"NoData"];
}

- (NSAttributedString *)titleForEmptyDataSet:(UIScrollView *)scrollView {
    NSString *text = self.emptyPageTitle?self.emptyPageTitle:@"";
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f],
                                 NSForegroundColorAttributeName: [UIColor grayColor]};
    return [[NSAttributedString alloc] initWithString:text attributes:attributes];
}

- (NSAttributedString *)descriptionForEmptyDataSet:(UIScrollView *)scrollView {
    
    NSString *text = self.emptyPageSubtitle;
    NSMutableParagraphStyle *paragraph = [NSMutableParagraphStyle new];
    paragraph.lineBreakMode = NSLineBreakByWordWrapping;
    paragraph.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont systemFontOfSize:14.0f],
                                 NSForegroundColorAttributeName: [UIColor lightGrayColor],
                                 NSParagraphStyleAttributeName: paragraph};
    return self.emptyPageSubtitle?[[NSAttributedString alloc] initWithString:text attributes:attributes]:nil;
}

- (BOOL)emptyDataSetShouldAllowTouch:(UIScrollView *)scrollView {
    return YES;
}

- (BOOL)emptyDataSetShouldDisplay:(UIScrollView *)scrollView {
    return self.isEmptyDataPage;
}

- (CGFloat)verticalOffsetForEmptyDataSet:(UIScrollView *)scrollView {
    return -self.NullDataTableView.tableHeaderView.frame.size.height/2.0f;
}

- (NSAttributedString *)buttonTitleForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    
    NSDictionary *attributes = @{NSFontAttributeName: [UIFont boldSystemFontOfSize:16.0f]};
    return self.emptyPageButtonTitle?[[NSAttributedString alloc] initWithString:self.emptyPageButtonTitle attributes:attributes]:nil;
}

- (UIImage *)buttonImageForEmptyDataSet:(UIScrollView *)scrollView forState:(UIControlState)state {
    return self.emptyPageButtonImage?[UIImage imageNamed:self.emptyPageButtonImage]:nil;
}

- (void)emptyDataSet:(UIScrollView *)scrollView didTapButton:(UIButton *)button {
    [self emptyDataPageButtonClick];
}

#pragma mark 按钮事件
-(void)emptyDataPageButtonClick {
    
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
