#import <Foundation/Foundation.h>
#import "Module.h"
#import "CalendarModule.h"
#import "EmergencyModule.h"
#import "LifeModule.h"
#import "GuideModule.h"
#import "TrafficModule.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        NSFileManager *fileManager= [NSFileManager defaultManager];
        
        //桌面路徑
        NSArray * paths = NSSearchPathForDirectoriesInDomains (NSDesktopDirectory, NSUserDomainMask, YES);
        NSString * path = [paths objectAtIndex:0];
        path = [path stringByAppendingPathComponent:@"iNTOUSource"];
        NSLog(@"%@",path);
        
        if(![fileManager fileExistsAtPath:path isDirectory:nil]) {
            [fileManager createDirectoryAtPath:path withIntermediateDirectories:NO attributes:nil error:nil];
        }
        
        NSMutableArray* modules = [NSMutableArray new];
        //以下添加新的模塊
        [modules addObject:[GuideModule new]];
        [modules addObject:[CalendarModule new]];
        [modules addObject:[EmergencyModule new]];
        [modules addObject:[LifeModule new]];
        [modules addObject:[TrafficModule new]];
        
        //執行下載
        for(Module* module in [modules copy])
            [module downloadDataFromServer:path];
        
        NSLog(@"完成！");
        
        //等待其他線程
        sleep(90);
    }
    return 0;
}
