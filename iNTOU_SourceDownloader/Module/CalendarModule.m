#import "CalendarModule.h"

@implementation CalendarModule

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://140.121.100.103:8080/CalendarServlet/CalendarServlet.do";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"version=0&dataType=json";
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    dispatch_semaphore_t semaphore = dispatch_semaphore_create(0);
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [json writeToFile:[path stringByAppendingPathComponent:@"CalendarModule.plist"] atomically:YES];
            NSLog(@"Calendar Success!");
        }
        else
            NSLog(@"Calendar Fail!");
        
        dispatch_semaphore_signal(semaphore);
    }];
    [task resume];
    
    dispatch_semaphore_wait(semaphore, DISPATCH_TIME_FOREVER);
}
@end
