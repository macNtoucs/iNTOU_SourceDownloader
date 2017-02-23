#import "Module.h"

@interface KeelungStop : Module <NSXMLParserDelegate>
{
    NSMutableArray* stopArrayTemp;
    NSMutableDictionary* stopTemp;
}

@end
