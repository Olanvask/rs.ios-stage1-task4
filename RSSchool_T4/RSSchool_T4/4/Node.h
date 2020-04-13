//
//  Node.h
//  RSSchool_T4
//
//  Created by Oleg Vasiluk on 4/12/20.
//  Copyright © 2020 iOSLab. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Node : NSObject
@property (nonatomic, strong) Node *left;
@property (nonatomic, strong) Node *right;
@property (nonatomic, strong) NSString *val;
@end

NS_ASSUME_NONNULL_END
