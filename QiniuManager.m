//
//  QiniuManager.m
//  awesomeMobile
//
//  Created by scott on 15/12/17.
//  Copyright © 2015年 Facebook. All rights reserved.
//

#import "QiniuManager.h"
#import "RCTBridge.h"

@implementation QiniuManager

- (NSString *)mimeTypeForData:(NSData *)data {
  uint8_t c;
  [data getBytes:&c length:1];

  switch (c) {
    case 0xFF:
      return @"image/jpeg";
      break;
    case 0x89:
      return @"image/png";
      break;
    case 0x47:
      return @"image/gif";
      break;
    case 0x49:
    case 0x4D:
      return @"image/tiff";
      break;
    case 0x25:
      return @"application/pdf";
      break;
    case 0xD0:
      return @"application/vnd";
      break;
    case 0x46:
      return @"text/plain";
      break;
    default:
      return @"application/octet-stream";
  }
  return nil;
}

RCT_EXPORT_MODULE();


RCT_EXPORT_METHOD(uploadToQiniu:(NSString *)uri
                  key:(NSString *)key
                  token:(NSString *)token
                  params:(NSDictionary *)params
                  callback:(RCTResponseSenderBlock)callback)
{
//  QNUploadManager *upManager = [[QNUploadManager alloc] init];

  QNUploadManager *upManager = [QNUploadManager sharedInstanceWithConfiguration:nil];

//  NSData *imageData = [NSData dataWithContentsOfFile: finalPath];
  NSError *error = nil;

  NSData *data = [NSData dataWithContentsOfFile: uri options:0 error:&error];

  NSString *mimeString = [self mimeTypeForData:data];
  NSMutableDictionary *mutableDict = [params mutableCopy];
  [mutableDict setObject:mimeString forKey:@"x:mimeType"];
  params = [mutableDict mutableCopy];


  self.opt = [[QNUploadOption alloc] initWithMime:mimeString progressHandler:nil params:params checkCrc:YES cancellationSignal:nil];

  [upManager putData:data key:key token:token
            complete: ^(QNResponseInfo *info, NSString *key, NSDictionary *resp) {
              callback(@[resp]);

            } option: self.opt];

}

@end
