//
//  BaseNullTableViewHandle.h
//  NullDataInterface
//
//  Created by 冯旭 on 16/02/2017.
//  Copyright © 2017 冯旭. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseNullTableViewHandle : UIViewController


@property (nonatomic, strong) UITableView * NullDataTableView;

//is show empty data page
@property (nonatomic, assign) BOOL isEmptyDataPage;

//Title
@property (nonatomic, strong) NSString * emptyPageTitle;

//Image
@property (nonatomic, strong) NSString * emptyPageImage;


//Subtitle
@property (nonatomic, strong) NSString * emptyPageSubtitle;


//ButtonTitle
@property (nonatomic, strong) NSString * emptyPageButtonTitle;


//ButtonImage
@property (nonatomic, strong) NSString * emptyPageButtonImage;


//ButtonClickåå
- (void) emptyDataPageButtonClick;


@end
