//
//  ViewController.m
//  QuickSortArray
//
//  Created by rongyun on 2017/7/4.
//  Copyright © 2017年 YXGang. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

/*
 设要排序的数组是mutableArray对象，首先任意选取一个数据（通常选用数组的第一个数）作为关键数据，
    然后将所有比它小的数都放到它前面，所有比它大的数都放到它后面，这个过程称为一次快速排序。
 
 步骤讲解
 
 1 ）.设置两个变量i，j ，排序开始时i = 0，就j = mutableArray.count - 1；
 
 2 ）.设置数组的第一个值为比较基准数key，key = mutableArray.count[0]；
 
 3 ）.因为设置key为数组的第一个值，所以先从数组最右边开始往前查找比key小的值。
    如果没有找到，j--继续往前搜索；
    如果找到则将mutableArray[i]和mutableArray[j]互换，并且停止往前搜索，进入第4步；
 
 4 ）.从i位置开始往后搜索比可以大的值，如果没有找到，i++继续往后搜索；
    如果找到则将mutableArray[i]和mutableArray[j]互换，并且停止往后搜索；
 
 5 ）.重复第3、4步，直到i == j（此时刚好执行完第三步或第四部），停止排序；
 */
@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    NSMutableArray *arr = [[NSMutableArray alloc] initWithObjects:@(6),@(1),@(2),@(5),@(9),@(4),@(3),@(7),nil];
    [self quickSortArray:arr withLeftIndex:0 andRightIndex:arr.count - 1];
    NSLog(@"%@",arr);

    // Do any additional setup after loading the view, typically from a nib.
}
- (void)quickSortArray:(NSMutableArray *)array withLeftIndex:(NSInteger)leftIndex andRightIndex:(NSInteger)rightIndex
{
    if (leftIndex >= rightIndex) {//如果数组长度为0或1时返回
        return ;
    }
    NSInteger i = leftIndex;
    NSInteger j = rightIndex;
    //记录比较基准数
    NSInteger key = [array[i] integerValue];
    while (i < j) {
        /**** 首先从右边j开始查找比基准数小的值 ***/
        while (i < j && [array[j] integerValue] >= key) {//如果比基准数大，继续查找
            j--;
        }
        //如果比基准数小，则将查找到的小值调换到i的位置
        array[i] = array[j];
        /**** 当在右边查找到一个比基准数小的值时，就从i开始往后找比基准数大的值 ***/
        while (i < j && [array[i] integerValue] <= key) {//如果比基准数小，继续查找
            i++;
        }
        //如果比基准数大，则将查找到的大值调换到j的位置
        array[j] = array[i];
    }
    //将基准数放到正确位置
    array[i] = @(key);
    /**** 递归排序 ***/
    //排序基准数左边的
    [self quickSortArray:array withLeftIndex:leftIndex andRightIndex:i - 1];
    //排序基准数右边的
    [self quickSortArray:array withLeftIndex:i + 1 andRightIndex:rightIndex];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
