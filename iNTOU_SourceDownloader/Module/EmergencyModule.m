#import "EmergencyModule.h"

@implementation EmergencyModule

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://140.121.91.62/contact/contact.php";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [json writeToFile:[path stringByAppendingPathComponent:@"EmergencyModule.plist"] atomically:YES];
            NSLog(@"Emergency Success!");
        }
        else
            NSLog(@"Emergency Fail!");
        
    }];
    [task resume];
    
}

@end
