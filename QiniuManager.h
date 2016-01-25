//
//  QiniuManager.h
//  awesomeMobile
//
//  Created by scott on 15/12/17.
//  Copyright © 2015年 Facebook. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "QiniuSDK.h"
#import "RCTBridgeModule.h"

@interface QiniuManager : NSObject <RCTBridgeModule>
@property (nonatomic, retain) QNUploadOption *opt;
@end
