#import "LifeModule.h"

@implementation LifeModule

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://140.121.100.103:8080/CircleServlet/CircleServlet.do";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSMutableURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    [request setHTTPMethod:@"POST"];
    NSString *postString = @"version=0&dataType=json";
    [request setHTTPBody:[postString dataUsingEncoding:NSUTF8StringEncoding]];
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:nil];
            [json writeToFile:[path stringByAppendingPathComponent:@"LifeModule.plist"] atomically:YES];
            NSLog(@"Life Success!");
        }
        else
            NSLog(@"Life Fail!");
        
    }];
    [task resume];
    
}

@end
