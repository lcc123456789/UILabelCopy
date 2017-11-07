//
//  CC_CopyLable.h
//  UILable_Copy
//
//  Created by mac on 17/1/4.
//  Copyright © 2017年 lcc. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef enum {
    LabelTypeDefault = 0,
    LabelTypeCopy = 1 << 0,
    LabelTypePaste = 1 << 1,
    LabelTypeCut = 1 << 2,
    LabelTypeSelectAll = 1 << 3,
    LabelTypeDelete = 1 << 4,
    LabelTypeShowAll = 0x1e,

}LabelType;

@interface CC_CopyLable : UILabel

@property (nonatomic,assign)      LabelType type;
+ (instancetype)cc_CopyLableWithType:(LabelType)type;
@end
