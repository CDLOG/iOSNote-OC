//
//  CLJDatePickAndCityPickVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/11.
//

#import "CLJDatePickAndCityPickVC.h"
#import "XMGProvince.h"
@interface CLJDatePickAndCityPickVC ()<UITextFieldDelegate,UIPickerViewDataSource,UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *birthdayField;

@property (nonatomic, weak) UIDatePicker *datePicker;

@property (nonatomic, weak) UIPickerView *pickerView;
@property (weak, nonatomic) IBOutlet UITextField *cityField;

@property (nonatomic, strong) NSMutableArray *provinces;

@property (nonatomic, assign) NSInteger proIndex;

@end

@implementation CLJDatePickAndCityPickVC
// 懒加载省会
- (NSMutableArray *)provinces
{
    if (_provinces == nil) {
        // 装所有的省会
        _provinces = [NSMutableArray array];
        
        // 加载plist文件
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"provinces.plist" ofType:nil];
        NSArray *arr = [NSArray arrayWithContentsOfFile:filePath];
        
        for (NSDictionary *dict in arr) {
            // 字典转模型
            XMGProvince *p = [XMGProvince provinceWithDict:dict];
            
            [_provinces addObject:p];
        }
    }
    return _provinces;
}

#pragma mark - UITextFieldDelegate

// 是否允许用户输入文字
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    return NO;
}

// 文本框开始编辑的时候调用
- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    if (textField == _birthdayField) {
        // 给生日文本框赋值
        [self dateChange:_datePicker];
        
    }else{
        // 给城市文本框赋值
        [self pickerView:_pickerView didSelectRow:0 inComponent:0];
    }
}

#pragma mark -viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    // 设置文本框的代码
    _birthdayField.delegate = self;
    _cityField.delegate = self;
    
    // 自定义生日键盘
    [self setUpBirthdayKeyboard];
    
    // 自定义城市键盘
    [self setUpCityKeyboard];
    
}
#pragma mark - 自定义城市键盘
- (void)setUpCityKeyboard
{
    UIPickerView *pickerView = [[UIPickerView alloc] init];
    
    _pickerView = pickerView;
    
    pickerView.dataSource = self;
    pickerView.delegate = self;
    
    _cityField.inputView = pickerView;
}


#pragma mark -UIPickerView
#pragma mark UIPickerView的数据源
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}

// pickerView的第0列描述省会，有多少个省
// pickerView的第1列描述选中的省会，有多少个城市
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会
        
        return self.provinces.count;
        
        
    }else{ // 描述选中的省会的城市
        
     
        
        // 获取省会
        XMGProvince *p = self.provinces[_proIndex];
        
        return p.cities.count;
        
    }
}
#pragma mark -UIPickerView的代理
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) { // 描述省会
        
        // 获取省会
        XMGProvince *p = self.provinces[row];
        return p.name;
        
    }else{ // 描述选中的省会的城市
        // 获取选中的省会的角标
        NSInteger index = [pickerView selectedRowInComponent:0];
        
        // 获取选中省会
        XMGProvince *p = self.provinces[_proIndex];
        

        // 当前选中的内蒙古省，只有12个城市，角标0~11，但是右边城市是北京，北京的城市大于12个城市，所以滚动的时候会出现越界。
        
        NSLog(@"province:%@, count:%ld row:%ld",p.name,p.cities.count,row);
        
#warning TODO:
        return p.cities[row];
    }
}

// 全局断点就是帮我们定位到出bug的那一行。

// 滚动UIPickerView就会调用
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) { // 滚动省会,刷新城市（1列）
        
        // 记录当前选中的省会
        _proIndex = [pickerView selectedRowInComponent:0];
        
        [pickerView reloadComponent:1];
        
    }
    
    // 给城市文本框赋值
    
  
    
    // 获取选中省会
    XMGProvince *p = self.provinces[_proIndex];
    
    // 获取选中的城市
    NSInteger cityIndex = [pickerView selectedRowInComponent:1];
    
    NSString *cityName = p.cities[cityIndex];
    
    _cityField.text = [NSString stringWithFormat:@"%@ %@",p.name,cityName];
}


#pragma mark -自定义生日键盘
- (void)setUpBirthdayKeyboard
{
    // 创建UIDatePicker
    // 注意：UIDatePicker有默认的尺寸，可以不用设置frame
    UIDatePicker *picker = [[UIDatePicker alloc] init];
    picker.frame = CGRectMake(0, 0, 375, 300);
    _datePicker = picker;
    
    // 设置地区 zh:中国
    picker.locale = [NSLocale localeWithLocaleIdentifier:@"zh"];
    
    // 设置日期的模式
    picker.datePickerMode = UIDatePickerModeDate;
    
    // 监听UIDatePicker的滚动
    [picker addTarget:self action:@selector(dateChange:) forControlEvents:UIControlEventValueChanged];
    
    
    _birthdayField.inputView = picker;
}

// 当UIDatePicker滚动的时候调用
// 给生日文本框赋值
- (void)dateChange:(UIDatePicker *)datePicker
{
    NSLog(@"%@",datePicker.date);
    // 日期转换字符串
    
    NSDateFormatter *fmt = [[NSDateFormatter alloc] init];
    
    fmt.dateFormat = @"yyyy-MM-dd";
    
    NSString *dateStr = [fmt stringFromDate:datePicker.date];
    
    _birthdayField.text = dateStr;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
