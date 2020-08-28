% https://blog.csdn.net/ErenTuring/article/details/72996042?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-4.nonecase
% https://blog.csdn.net/Wu_Jesse_David/article/details/106118347?utm_medium=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase&depth_1-utm_source=distribute.pc_relevant.none-task-blog-BlogCommendFromMachineLearnPai2-2.nonecase

clc; %���������еĲ���
clear; %������������

clc;
clear;

A = [1, 2, 7, 5, 5;
    1/2, 1, 4, 3, 3;
    1/7, 1/4, 1, 1/2, 1/3;
    1/5, 1/3, 2, 1, 1;
    1/5, 1/3, 3, 1, 1]

R = rank(A); %���жϾ������

%���ضԱȾ���A��ֻ��Ҫ�ı����A
[m, n] = size(A); %��ȡָ�����
RI = [0 0 0.58 0.90 1.12 1.24 1.32 1.41 1.45 1.49 1.51];

[V, D] = eig(A); % �����A��ȫ������ֵ�����ɶԽ���D������A��������������V��������
tz = max(D);
B = max(tz);  % �������ֵ
disp('�������ֵ B='); disp(B);
[row, col] = find(D == B); %�������ֵ����λ��
C = V(:, col); % ��Ӧ��������
CI = (B - n) / (n - 1); % ����һ���Լ���ָ��CI
disp('RI��');disp(RI(1, n));
disp('n��'); disp(n)
CR = CI / RI(1, n);

if CR < 0.10
    disp('CI='); disp(CI);
    disp('CR='); disp(CR);
    disp('�ԱȾ���Aͨ��һ���Լ��飬������Ȩ������QΪ��');
    Q = zeros(n, 1);

    for i = 1:n
        Q(i, 1) = C(i, 1) / sum(C(:, 1)); %����������׼��
    end

    Q%���Ȩ������
else
    disp('�ԱȾ���Aδͨ��һ���Լ��飬��ԶԱȾ���A���¹���');
end
