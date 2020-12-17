%问题1 情景2
clear;clc;
a=223;
R=[10*a,-2*a];
O=[10*a,4*a];
vR=12;
vW=30;%狼的速度

%初始坐标
xR=10*a;
yR=-2*a;
xW=0;
yW=0;
tend=6*a/vR;
det_t=0.1;

N=tend/det_t;
%记录坐标的数组
X1=zeros(1,N+10);
Y1=zeros(1,N+10);
X2=zeros(1,N+10);
Y2=zeros(1,N+10);
X1(1)=0;
Y1(1)=0;
X2(1)=10*a;
Y2(1)=-2*a;
nn=1;

%时间步长det_t
for t=0:det_t:tend
    %计算兔子相对于狼的方向
    Fxx=xR-xW;
    Fyy=yR-yW;
    Fzz=sqrt(Fxx^2+Fyy^2);
    %判断是否相遇
    if(Fzz<0.2)
        disp('Catch!')
        
        %输出相遇时间
        disp(t)
        %输出相遇
        disp(xW)
        disp(yW)
        break;
    end
   %计算兔子在 det_t时间段的路程
    det_yR=det_t*vR;
    %更新兔子的坐标
    yR=yR+det_yR;
    
    s=det_t*vW;
    sxx=(s*Fxx)/Fzz;
    syy=(s*Fyy)/Fzz;
    %更新狼的坐标
    xW=xW+sxx;
    yW=yW+syy;
    
    nn=nn+1;
    %记录坐标值，方便画图
    X1(nn)=xW;
    Y1(nn)=yW;
    X2(nn)=xR;
    Y2(nn)=yR; 
end

plot(X1,Y1,'*',X2,Y2,'o')
