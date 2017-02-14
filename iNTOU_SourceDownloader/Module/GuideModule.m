#import "GuideModule.h"

@implementation GuideModule

-(void)downloadDataFromServer:(NSString*)path {
    NSArray* data = @[@{@"學生專區":@[@{@"各科系館":@[@{@"name":@"海洋環境資訊系館",@"id":@"OCE",@"longitude":@121.773339,@"latitude":@25.149881}
                                                 ,@{@"name":@"食品科學系工程館",@"id":@"MFE",@"longitude":@121.772986,@"latitude":@25.150667}
                                                 ,@{@"name":@"環境生物與漁業科學學系館",@"id":@"FSH",@"longitude":@121.772267,@"latitude":@25.149667}
                                                 ,@{@"name":@"食品科學系館",@"id":@"MFS",@"longitude":@121.773644,@"latitude":@25.150792}
                                                 ,@{@"name":@"航運管理學系館",@"id":@"STM",@"longitude":@121.778464,@"latitude":@25.149469}
                                                 ,@{@"name":@"延平技術大樓",@"id":@"TEC",@"longitude":@121.777794,@"latitude":@25.149214}
                                                 ,@{@"name":@"生命科學院館",@"id":@"CLS",@"longitude":@121.772619,@"latitude":@25.150589}
                                                 ,@{@"name":@"河工二館",@"id":@"HR2、IMB",@"longitude":@121.782647,@"latitude":@25.150133}
                                                 ,@{@"name":@"河工一館",@"id":@"HR1、HRE",@"longitude":@121.781450,@"latitude":@25.150217}
                                                 ,@{@"name":@"系工系館",@"id":@"NVA、PFB",@"longitude":@121.781025,@"latitude":@25.150356}
                                                 ,@{@"name":@"工學院館",@"id":@"CE-",@"longitude":@121.780853,@"latitude":@25.150650}
                                                 ,@{@"name":@"電機一館",@"id":@"EE1",@"longitude":@121.780572,@"latitude":@25.150503}
                                                 ,@{@"name":@"資工系及電機二館",@"id":@"INS、ELE",@"longitude":@121.780133,@"latitude":@25.150911}
                                                 ,@{@"name":@"機械一館及電算中心",@"id":@"MEA、CC3、CC4",@"longitude":@121.776436,@"latitude":@25.150281}
                                                 ,@{@"name":@"機械二館",@"id":@"MEB",@"longitude":@121.776922,@"latitude":@25.150025}
                                                 ,@{@"name":@"商船系館",@"id":@"NAV",@"longitude":@121.777642,@"latitude":@25.149725}]}
                                     ,@{@"學生活動領域":@[@{@"name":@"育樂館",@"id":@"STA",@"longitude":@121.777006,@"latitude":@25.149625}
                                                    ,@{@"name":@"第一餐廳",@"id":@"FRB",@"longitude":@121.775178,@"latitude":@25.149031}
                                                    ,@{@"name":@"海洋廳及展示廳",@"id":@"",@"longitude":@121.775722,@"latitude":@25.149805}
                                                    ,@{@"name":@"大游泳池",@"id":@"",@"longitude":@121.778897,@"latitude":@25.149178}
                                                    ,@{@"name":@"溫水游泳池",@"id":@"",@"longitude":@121.779522,@"latitude":@25.149327}
                                                    ,@{@"name":@"圖書館",@"id":@"LIB",@"longitude":@121.775481,@"latitude":@25.150247}
                                                    ,@{@"name":@"學生活動中心",@"id":@"",@"longitude":@121.779913,@"latitude":@25.150127}
                                                    ,@{@"name":@"體育館",@"id":@"GYM",@"longitude":@121.779000,@"latitude":@25.150089}
                                                    ,@{@"name":@"五楠書局",@"id":@"",@"longitude":@121.775600,@"latitude":@25.150411}
                                                    ,@{@"name":@"運動場",@"id":@"",@"longitude":@121.7775492,@"latitude":@25.1505696}
                                                    ,@{@"name":@"網球場",@"id":@"",@"longitude":@121.773114,@"latitude":@25.150192}
                                                    ,@{@"name":@"夢泉",@"id":@"",@"longitude":@121.775008,@"latitude":@25.149172}
                                                    ,@{@"name":@"射箭場",@"id":@"",@"longitude":@121.775594,@"latitude":@25.148811}
                                                    ,@{@"name":@"小艇碼頭",@"id":@"",@"longitude":@121.775311,@"latitude":@25.15179}]}
                                     ,@{@"研究/實驗中心":@[@{@"name":@"海洋環境化學與生態研究所館",@"id":@"",@"longitude":@121.773681,@"latitude":@25.149261}
                                                     ,@{@"name":@"臺灣藻類資源應用研發中心",@"id":@"",@"longitude":@121.773533,@"latitude":@25.150142}
                                                     ,@{@"name":@"養殖系溫室",@"id":@"",@"longitude":@121.773661,@"latitude":@25.149753}
                                                     ,@{@"name":@"海洋工程綜合實驗館",@"id":@"",@"longitude":@121.782486,@"latitude":@25.150033}
                                                     ,@{@"name":@"臨海工作站",@"id":@"",@"longitude":@121.775764,@"latitude":@25.151197}
                                                     ,@{@"name":@"綜合研究中心",@"id":@"GRC",@"longitude":@121.775731,@"latitude":@25.150522}
                                                     ,@{@"name":@"陸生動物實驗中心",@"id":@"",@"longitude":@121.773411,@"latitude":@25.150814}
                                                     ,@{@"name":@"水生動物實驗中心",@"id":@"AAC",@"longitude":@121.779400,@"latitude":@25.150911}
                                                     ,@{@"name":@"大型空蝕水槽試驗館",@"id":@"",@"longitude":@121.783208,@"latitude":@25.149742}
                                                     ,@{@"name":@"輪機工廠",@"id":@"",@"longitude":@121.778222,@"latitude":@25.149992}
                                                     ,@{@"name":@"操船模擬機器室",@"id":@"",@"longitude":@121.777794,@"latitude":@25.149736}
                                                     ,@{@"name":@"臨海生物教學實驗場",@"id":@"",@"longitude":@121.779100,@"latitude":@25.150914}]}
                                     ,@{@"學生宿舍":@[@{@"name":@"女生第一宿舍",@"id":@"",@"longitude":@121.774044,@"latitude":@25.148756}
                                                   ,@{@"name":@"女生第二宿舍及男生第三宿舍",@"id":@"",@"longitude":@121.779078,@"latitude":@25.148603}
                                                   ,@{@"name":@"男生第一宿舍",@"id":@"",@"longitude":@121.775325,@"latitude":@25.148586}
                                                   ,@{@"name":@"男生第二宿舍",@"id":@"",@"longitude":@121.778881,@"latitude":@25.148572}
                                                   ,@{@"name":@"國際學生宿舍",@"id":@"",@"longitude":@121.766489,@"latitude":@25.144303}]}]}
                           ,@{@"教職員/綜合大樓":@[@{@"教職員宿舍":@[@{@"name":@"首長宿舍",@"id":@"",@"longitude":@121.750208,@"latitude":@25.144847}
                                                          ,@{@"name":@"祥豐單身宿舍",@"id":@"",@"longitude":@121.766875,@"latitude":@25.144847}
                                                          ,@{@"name":@"職務宿舍(二期)",@"id":@"",@"longitude":@121.766528,@"latitude":@25.144100}
                                                          ,@{@"name":@"職務宿舍(三期)",@"id":@"",@"longitude":@121.766647,@"latitude":@25.144164}]}
                                            ,@{@"綜合館及大樓":@[@{@"name":@"綜合一館",@"id":@"GH1",@"longitude":@121.772891,@"latitude":@25.149666}
                                                            ,@{@"name":@"綜合二館",@"id":@"GH2",@"longitude":@121.774883,@"latitude":@25.150599}
                                                            ,@{@"name":@"綜合三館",@"id":@"GH3",@"longitude":@121.775366,@"latitude":@25.149386}
                                                            ,@{@"name":@"行政資訊大樓",@"id":@"",@"longitude":@121.776158,@"latitude":@25.150256}
                                                            ,@{@"name":@"生科院辦公室",@"id":@"",@"longitude":@121.773533,@"latitude":@25.150141}
                                                            ,@{@"name":@"延平技術大樓",@"id":@"TEC",@"longitude":@121.777794,@"latitude":@25.149213}
                                                            ,@{@"name":@"海空大樓",@"id":@"SAH",@"longitude":@121.778852,@"latitude":@25.149469}
                                                            ,@{@"name":@"人文大樓",@"id":@"BOH",@"longitude":@121.775086,@"latitude":@25.149802}
                                                            ,@{@"name":@"沛華大樓",@"id":@"",@"longitude":@121.772611,@"latitude":@25.150058}
                                                            ,@{@"name":@"海事大樓甲棟",@"id":@"MAF",@"longitude":@121.774491,@"latitude":@25.149827}
                                                            ,@{@"name":@"海事大樓乙棟",@"id":@"MAF",@"longitude":@121.774599,@"latitude":@25.149405}
                                                            ,@{@"name":@"海事大樓丙棟",@"id":@"MAF",@"longitude":@121.774108,@"latitude":@25.149327}]}]}
                           ,@{@"其他":@[@{@"校門口、警衛室":@[@{@"name":@"濱海變電站",@"id":@"",@"longitude":@121.780783,@"latitude":@25.149897}
                                                      ,@{@"name":@"祥豐警衛室",@"id":@"",@"longitude":@121.772588,@"latitude":@25.150805}
                                                      ,@{@"name":@"濱海校門",@"id":@"",@"longitude":@121.776138,@"latitude":@25.150624}
                                                      ,@{@"name":@"祥豐校門",@"id":@"",@"longitude":@121.772475,@"latitude":@25.150816}
                                                      ,@{@"name":@"郵局",@"id":@"",@"longitude":@121.775844,@"latitude":@25.150594}]}]}
                           ];
    [data writeToFile:[path stringByAppendingPathComponent:@"GuideModule.plist"] atomically:YES];
    NSLog(@"GuideModule Success!");
}

@end
