#!/usr/bin/env python
# 
# 代码来源 https://www.cnblogs.com/yhll/p/9967726.html
# 解析 https://blog.csdn.net/Trisyp/article/details/106017533?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-1.channel_param
# 
# 广东省土地利用变化与土地生态安全评价研究_黄翠婷
# 求特征向量较为常见的的计算方法有特征向量法、方根法、正规化法以及和积法求和法。
# 第一种方法则是严格计算特征向量的方法，后三种方法是近似方法，使用非常简便，人们只要使用小型计算器并保证足够精确度的条件下就可应用。下面简单介绍一下本文章接下来将运用到的求和法的基本计算步骤
# 
# -*- coding: utf-8 -*-
import numpy as np

RI_dict = {1: 0, 2: 0, 3: 0.58, 4: 0.90, 5: 1.12, 6: 1.24, 7: 1.32, 8: 1.41, 9: 1.45}

def get_w(array):
    row = array.shape[0]  # 计算出阶数 5 
    a_axis_0_sum = array.sum(axis=0)  # 列相加之和 1*5矩阵
    print(a_axis_0_sum) #[ 2.04285714  3.91666667 17.         10.5        10.33333333]
    b = array / a_axis_0_sum  # 新的矩阵b 1*5矩阵/
    print(b)
    # b_axis_0_sum = b.sum(axis=0)
    b_axis_1_sum = b.sum(axis=1)  # 每一行
    # print(b_axis_1_sum)
    w = b_axis_1_sum / row  # 归一化处理(特征向量)
    # nw = w * row
    # 了解特征向量，求特征值
    AW = (w * array).sum(axis=1)   # 
    print(AW)
    max_max = sum(AW / (row * w))
    print('准则层：最大特征值', max_max)
    CI = (max_max - row) / (row - 1)
    print('CI ', CI)
    CR = CI / RI_dict[row]
    print('CR：', CR)
    if CR < 0.1:
        # print(round(CR, 3))
        # print('满足一致性')
        # print(np.max(w))
        # print(sorted(w,reverse=True))
        # print(max_max)
        print('特征向量:%s' % w)
        return w
    else:
        print(round(CR, 3))
        print('不满足一致性，请进行修改')


def main(array):
    # Ndarray 对象 用于存放同类型元素的多维数组
    if type(array) is np.ndarray: 
        return get_w(array)
    else:
        print('请输入numpy对象')


if __name__ == '__main__':
    # 由于地方问题，矩阵我就写成一行了
    e = np.array([[1, 2, 7, 5, 5], [1 / 2, 1, 4, 3, 3], [1 / 7, 1 / 4, 1, 1 / 2, 1 / 3], [1 / 5, 1 / 3, 2, 1, 1], [1 / 5, 1 / 3, 3, 1, 1]])
    a = np.array([[1, 1 / 3, 1 / 8], [3, 1, 1 / 3], [8, 3, 1]])
    b = np.array([[1, 2, 5], [1 / 2, 1, 2], [1 / 5, 1 / 2, 1]])
    c = np.array([[1, 1, 3], [1, 1, 3], [1 / 3, 1 / 3, 1]])
    d = np.array([[1, 3, 4], [1 / 3, 1, 1], [1 / 4, 1, 1]])
    f = np.array([[1, 4, 1 / 2], [1 / 4, 1, 1 / 4], [2, 4, 1]])
    # e = main(e)
    a = main(a)
    # b = main(b)
    # c = main(c)
    # d = main(d)
    # f = main(f)
    try:
        res = np.array([a, b, c, d, f])
        ret = (np.transpose(res) * e).sum(axis=1) # transpose 转置
        print(ret)
    except TypeError:
        print('数据有误，可能不满足一致性，请进行修改')