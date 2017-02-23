#import "KeelungStop.h"

@implementation KeelungStop

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://ebus.klcba.gov.tw/Gio.ebus.web/BusData/stop";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSXMLParser* parser = [[NSXMLParser alloc]initWithData:data];
            parser.delegate = self;
            if([parser parse]) {
                [[stopArrayTemp copy] writeToFile:[path stringByAppendingPathComponent:@"KeelungBusStop.plist"] atomically:YES];
                NSLog(@"KeelungStop Success!");
            }
        }
        else
            NSLog(@"KeelungStop Fail!");
        
    }];
    [task resume];
}

#pragma mark - NSxmlParser

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    stopArrayTemp = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if([elementName isEqualToString:@"Station"]) {
        stopTemp = [NSMutableDictionary new];
        for(NSString* key in [attributeDict allKeys])
            [stopTemp setObject:attributeDict[key] forKey:key];
        [stopArrayTemp addObject:[stopTemp copy]];
    }
}

@end
