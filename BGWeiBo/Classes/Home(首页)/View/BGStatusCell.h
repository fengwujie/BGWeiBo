//
//  BGStatusCell.h
//  BGWeiBo
//
//  Created by fengwujie on 15/10/8.
//  Copyright © 2015年 BG. All rights reserved.
//

#import <Foundation/Foundation.h>

@class BGStatusFrame;

@interface BGStatusCell : UITableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@property (nonatomic, strong) BGStatusFrame *statusFrame;
@end
