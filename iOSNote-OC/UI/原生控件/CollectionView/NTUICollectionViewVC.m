//
//  NTUICollectionViewVC.m
//  iOSNote-OC
//
//  Created by 陈乐杰 on 2023/1/18.
//

#import "NTUICollectionViewVC.h"
#import "NTCollectionViewCell.h"

@interface NTUICollectionViewVC ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource,UICollectionViewDelegate>

//collectionView的父控件
@property (weak, nonatomic) IBOutlet UIView *itemContent;
@property (strong,nonatomic) UICollectionView * collectionView;
@property (strong,nonatomic) UICollectionViewFlowLayout * flowLayout;
@end

@implementation NTUICollectionViewVC




- (void)createCollectionView{
    //关闭自适应
    if(_collectionView == nil){
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 0, self.itemContent.bounds.size.width, self.itemContent.bounds.size.height) collectionViewLayout:self.flowLayout];
        _collectionView.dataSource = self;
        _collectionView.delegate = self;
    //不显示滚动条
        _collectionView.showsHorizontalScrollIndicator = NO;
       _collectionView.showsVerticalScrollIndicator = NO;
        _collectionView.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:0.8 ];
        NSLog(@"--%@",_collectionView);
        [self.itemContent addSubview: _collectionView];
        NSLog(@"--%@",self.itemContent);
        //注册cell
        
        [_collectionView registerNib:[UINib nibWithNibName:NTCollectionViewCellID bundle:nil] forCellWithReuseIdentifier:NTCollectionViewCellID];
    }
    _collectionView.frame = CGRectMake(0, 0, self.itemContent.bounds.size.width, self.itemContent.bounds.size.height);
    NSLog(@"--%@",_collectionView);

}
/// 设置CollectionView的布局
- (UICollectionViewFlowLayout *)flowLayout {
    if (!_flowLayout) {
        _flowLayout = [[UICollectionViewFlowLayout alloc]init];
        //设置单元格大小
        _flowLayout.itemSize = CGSizeMake(160, 190);
        //最小行间距(默认为10)
        _flowLayout.minimumLineSpacing = 10;
        //最小item间距（默认为10）
        _flowLayout.minimumInteritemSpacing = 10;
        //设置senction的内边距
        _flowLayout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
        //设置UICollectionView的滑动方向
        _flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    }
    return _flowLayout;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
//控件的添加要在xib的控件布局完成后再添加
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self createCollectionView];

}
#pragma mark - collection delegate

//分组个数
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

//每个分组有多少个cell
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
//    return self.dataSource.count;
    return  2;
}

//cell内容设置
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NTCollectionViewCell * cell = [collectionView dequeueReusableCellWithReuseIdentifier:NTCollectionViewCellID forIndexPath:indexPath];
//    [cell setUPModel:[self.dataSource objectAtIndex:indexPath.row]];
    
    return cell;
}

//选中cell
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NTCollectionViewCell * cell = [collectionView cellForItemAtIndexPath:indexPath];
    
    
}
#pragma mark --UICollectionViewDelegateFlowLayout
//定义每个UICollectionView 的大小,根据真实的文字占用,算出大小
//使用相关的代理会使FlowLayout的设置无效
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return  [self getMultiLineWithFont:14 andText:@"文字宽度文字宽度文字宽度"];
//}

//根据文字计算cell大小
- (CGSize)getMultiLineWithFont:(NSInteger)font andText:(NSString *)text
{
    CGSize size  = [text boundingRectWithSize:CGSizeMake([UIScreen mainScreen].bounds.size.width - 20, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:font]} context:nil].size;
    return size;
}

@end
