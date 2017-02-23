#import "KeelungProvider.h"

@implementation KeelungProvider

-(void)downloadDataFromServer:(NSString*)path {
    NSString* urlString = @"http://ebus.klcba.gov.tw/Gio.ebus.web/BusData/Provider";
    NSURL* url = [[NSURL alloc]initWithString:urlString];
    NSURLRequest* request = [[NSMutableURLRequest alloc]initWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:60.0];
    
    
    NSURLSession* session = [NSURLSession sharedSession];
    NSURLSessionDataTask* task = [session dataTaskWithRequest:[request copy] completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        if(data) {
            NSXMLParser* parser = [[NSXMLParser alloc]initWithData:data];
            parser.delegate = self;
            if([parser parse]) {
                [[providerArrayTemp copy] writeToFile:[path stringByAppendingPathComponent:@"KeelungBusProvider.plist"] atomically:YES];
                NSLog(@"KeelungProvider Success!");
            }
        }
        else
            NSLog(@"KeelungProvider Fail!");
        
    }];
    [task resume];
}

#pragma mark - NSxmlParser

- (void)parserDidStartDocument:(NSXMLParser *)parser {
    providerArrayTemp = [NSMutableArray new];
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName
    attributes:(NSDictionary<NSString *,NSString *> *)attributeDict {
    if([elementName isEqualToString:@"Provider"]) {
        providerTemp = [NSMutableDictionary new];
        for(NSString* key in [attributeDict allKeys])
            [providerTemp setObject:attributeDict[key] forKey:key];
        [providerArrayTemp addObject:[providerTemp copy]];
    }
}

@end
