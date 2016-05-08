//
//  ViewController.m
//  RSA加密
//
//  Created by basic_10 on 16/5/3.
//  Copyright © 2016年 XHTeng. All rights reserved.
//

#import "ViewController.h"
#import <CommonCrypto/CommonCrypto.h>
#import "XHCryptorTools.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
     XHCryptorTools *tools = [[XHCryptorTools alloc] init];
    //1加载公钥
    NSString *pubPath = [[NSBundle mainBundle] pathForResource:@"rsacert.der" ofType:nil];
    [tools loadPublicKeyWithFilePath:pubPath];
    //2:使用公钥加密
    NSString *result = [tools RSAEncryptString:@"123456jkkkhhh"];
    NSLog(@"加密之后的结果是:%@",result);
    //3:加载私钥,并且指定导出p12时设定的密码
    NSString *privatePath = [[NSBundle mainBundle] pathForResource:@"p.p12" ofType:nil];
    [tools loadPrivateKey:privatePath password:@"123456"];
    // 4. 使用私钥解密
    NSLog(@"解密结果 %@", [tools RSADecryptString:result]);

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
