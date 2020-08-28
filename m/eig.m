% https://blog.csdn.net/ErenTuring/article/details/72996042?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase
% https://blog.csdn.net/Wu_Jesse_David/article/details/106118347?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase

clc; %清理命令行的操作
clear; %清理工作区变量

clc;
clear;

A = [1, 2, 7, 5, 5;
    1/2, 1, 4, 3, 3;
    1/7, 1/4, 1, 1/2, 1/3;
    1/5, 1/3, 2, 1, 1;
    1/5, 1/3, 3, 1, 1]

R = rank(A); %求判断矩阵的秩

%因素对比矩阵A，只需要改变矩阵A
[m, n] = size(A); %获取指标个数
RI = [0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];

[V, D] = eig(A); % 求矩阵A的全部特征值，构成对角阵D；并求A的特征向量构成V的列向量
tz = max(D);
B = max(tz);  % 最大特征值
disp('最大特征值 B='); disp(B);
[row, col] = find(D == B); %最大特征值所在位置
C = V(:, col); % 对应特征向量
CI = (B - n) / (n - 1); % 计算一致性检验指标CI
disp('RI：');disp(RI(1, n));
disp('n：'); disp(n)
CR = CI / RI(1, n);

if CR < 0.10
    disp('CI='); disp(CI);
    disp('CR='); disp(CR);
    disp('对比矩阵A通过一致性检验，各向量权重向量Q为：');
    Q = zeros(n, 1);

    for i = 1:n
        Q(i, 1) = C(i, 1) / sum(C(:, 1)); %特征向量标准化
    end

    Q%输出权重向量
else
    disp('对比矩阵A未通过一致性检验，需对对比矩阵A重新构造');
end
