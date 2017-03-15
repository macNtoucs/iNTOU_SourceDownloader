//
//  TrafficModule.m
//  iNTOU_SourceDownloader
//
//  Created by Jheng-Chi on 2017/3/15.
//  Copyright © 2017年 Lab414. All rights reserved.
//

#import "TrafficModule.h"

@implementation TrafficModule

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://localhost/TrafficAPI_ver2.0/train/TrainStationList.php";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSArray* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [json writeToFile:[path stringByAppendingPathComponent:@"TrainStationList.plist"] atomically:YES];
            NSLog(@"TrainStationList Success!");
        }
        else
            NSLog(@"TrainStationList Fail!");
        
    }];
    [task resume];
    
}

@end
