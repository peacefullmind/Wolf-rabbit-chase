%������

%����SafeOrNot�������������������л���������ĳ�ʼ��
clear;clc;
a=223;
figure(1)
axis([-5*a 5*a -5*a 5*a]);

for i=-50*a:300:50*a
    for j=-50*a:300:50*a
        Rcatch=SafeOrNot(i,j)
        if Rcatch==1
            plot(i,j,'*r')
            hold on
        end
       
    end
end
