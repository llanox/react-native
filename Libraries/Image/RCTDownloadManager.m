//
//  RCTDownloadManager.m
//  GoldfingrNative
//
//  Created by Juan Gabriel Gutierrez on 2015-06-09.
//  Copyright (c) 2015 Facebook. All rights reserved.
//

#import "RCTDownloadManager.h"
#import "RCTImageDownloader.h"
#import "RCTCache.h"
#import "RCTLog.h"

@implementation RCTDownloadManager
{
  RCTImageDownloader *_imageDownloader;
  id _downloadToken;
}

   RCT_EXPORT_MODULE();

   RCT_EXPORT_METHOD(downloadImageWithUrl:(NSURL *)url response:(RCTResponseSenderBlock)callback){
    
     
     _imageDownloader = [RCTImageDownloader sharedInstance];
    
     [_imageDownloader downloadDataForURL:url block:^(NSData *data, NSError *error) {
       
      if (error) {
         RCTLogWarn(@"Unable to download image data. Error: %@", error);
         callback(@[[NSNull null], @"Error"]);
         return;
       }
       
       if (data) {
         RCTLogWarn(@"Downloaded image data. Data: %@", data);
         callback(@[[NSNull null], @"Downloaded image data"]);
         return;
       }
       
       
     }];

     
    
    
     
   }


RCT_EXPORT_METHOD(downloadImageWithUrl:(NSURL *)url ){
  
  
  _imageDownloader = [RCTImageDownloader sharedInstance];
  
  [_imageDownloader downloadDataForURL:url block:^(NSData *data, NSError *error) {
    
    if (error) {
      RCTLogWarn(@"Unable to download image data. Error: %@", error);
     
      return;
    }
    
    if (data) {
      RCTLogWarn(@"Downloaded image data. Data: %@", data);
      return;
    }
    
    
  }];
  
  
  
  
  
}




  RCT_EXPORT_METHOD(listDownloadedData:(RCTResponseSenderBlock)callback){
  
   NSMutableArray *serializedContacts = [NSMutableArray new];
   callback(@[[NSNull null], serializedContacts]);
  
}

@end
