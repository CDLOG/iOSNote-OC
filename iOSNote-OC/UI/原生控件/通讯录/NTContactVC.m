//
//  NTContactVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/2/24.
//

#import "NTContactVC.h"
#import <ContactsUI/ContactsUI.h>
@interface NTContactVC ()<CNContactPickerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *showlable;

@end

@implementation NTContactVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//打开系统通讯录
- (IBAction)openSysContact:(id)sender {
    
    
    // 检查应用程序是否被授权访问通讯录
    if ([CNContactStore authorizationStatusForEntityType:CNEntityTypeContacts] == CNAuthorizationStatusAuthorized) {
        // 已授权
        NSLog(@"已经授权访问通讯录");
        [self pushVC];
    } else {
        // 未授权
        NSLog(@"未授权,请求授权访问通讯录");
        
        // 请求访问通讯录授权
        CNContactStore *store = [[CNContactStore alloc] init];
        [store requestAccessForEntityType:CNEntityTypeContacts completionHandler:^(BOOL granted, NSError *error) {
            if (granted) {
                // 用户已经授权
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 在主线程上执行UI更新操作
                    [self pushVC];
                });
                
            } else {
                // 用户未授权或者授权失败
                NSLog(@"用户未授权或者授权失败");
                //提醒去设置中打开授权
                dispatch_async(dispatch_get_main_queue(), ^{
                    // 在主线程上执行UI更新操作
                    [self pushTwo];
                });
            }
        }];
    }
    
}
//弹出系统通讯录
-(void)pushVC{
    // 1.创建控制器
    CNContactPickerViewController *contactPicker = [[CNContactPickerViewController alloc] init];

    
    // 2.设置代理
    contactPicker.delegate = self;
    
    // 3.弹出控制器
    [self presentViewController:contactPicker animated:YES completion:nil];
}
-(void)pushTwo{
    
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"授权通讯录"
    message:@"在设置中打开通讯录权限以便更好的使用体验。"
    preferredStyle:UIAlertControllerStyleAlert];
    [alertController addAction:[UIAlertAction actionWithTitle:@"取消"
    style:UIAlertActionStyleCancel
    handler:nil]];
    [alertController addAction:[UIAlertAction actionWithTitle:@"去设置"
    style:UIAlertActionStyleDefault
    handler:^(UIAlertAction * _Nonnull action) {
        [NTTools openSettingWithID:nil];
    }]];
    [self presentViewController:alertController animated:YES completion:nil];
}


#pragma mark -CNContactPickerDelegate
- (void)contactPicker:(CNContactPickerViewController *)picker didSelectContact:(CNContact *)contact {
    // 处理选中的联系人信息
    NSLog(@"%@%@",contact.familyName,contact.givenName);
    for (CNLabeledValue *labelValue in contact.phoneNumbers) {
        CNPhoneNumber *phoneNumber = labelValue.value;
        NSString *phoneNumberString = phoneNumber.stringValue;
        NSLog(@"联系人的电话号码为：%@", phoneNumberString);
    }
}

- (void)contactPickerDidCancel:(CNContactPickerViewController *)picker {
    // 取消按钮点击
}



//获取全部的联系人信息
- (IBAction)getAppContactACtion:(id)sender {
    
    dispatch_queue_t backgroundQueue = dispatch_queue_create("backgroundQueue", NULL);

    dispatch_async(backgroundQueue, ^{
        // 需要执行的耗时操作
        [self getAllPeople];
        dispatch_async(dispatch_get_main_queue(), ^{
            // 在主线程上执行UI更新操作
        });
    });
    
    
}

-(void)getAllPeople{
    // 获取全部联系人
    CNContactStore *contactStore = [[CNContactStore alloc] init];
    NSArray<CNContact *> *contacts = [contactStore unifiedContactsMatchingPredicate:nil
                                                        keysToFetch:@[CNContactGivenNameKey, CNContactFamilyNameKey, CNContactPhoneNumbersKey]
                                                              error:nil];

    // 打印联系人信息
    for (CNContact *contact in contacts) {
        NSString *name = [NSString stringWithFormat:@"%@ %@", contact.familyName, contact.givenName];
        NSLog(@"姓名：%@", name);
        
        for (CNLabeledValue<CNPhoneNumber *> *phoneNumber in contact.phoneNumbers) {
            NSString *number = phoneNumber.value.stringValue;
            NSLog(@"电话:%@",  number);
        }
    }
}

@end
