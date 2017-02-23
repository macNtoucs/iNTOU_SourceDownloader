#import "KeelungRoute.h"

@implementation KeelungRoute

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://ebus.klcba.gov.tw/Gio.ebus.web/BusData/Route";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSXMLParser* parser = [[NSXMLParser alloc]initWithData:data];
            parser.delegate = self;
            if([parser parse]) {
                [[routeArrayTemp copy] writeToFile:[path stringByAppendingPathComponent:@"KeelungBusRoute.plist"] atomically:YES];
                NSLog(@"KeelungRoute Success!");
            }
        }
        else
            NSLog(@"KeelungRoute Fail!");
        
    }];
    [task resume];
}

#pragma mark - NSxmlParser

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    routeArrayTemp = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if([elementName isEqualToString:@"Route"]) {
        routeTemp = [NSMutableDictionary new];
        for(NSString* key in [attributeDict allKeys])
            [routeTemp setObject:attributeDict[key] forKey:key];
        [routeArrayTemp addObject:[routeTemp copy]];
    }
}



@end
