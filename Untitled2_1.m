%问题2 求最小速度
%问题2

clear;
clc;
a=223;
R=[10*a,-2*a];
O=[10*a,4*a];
vR=12;


% 狼的速度的区间遍历
for vW=12:0.1:60
    
    xR=10*a;
    yR=-2*a;
    xW=0;
    yW=0;
    tend=6*a/vR;
    det_t=0.1;

    N=tend/det_t;
    X1=zeros(1,N+10);
    Y1=zeros(1,N+10);
    X2=zeros(1,N+10);
    Y2=zeros(1,N+10);
    X1(1)=0;
    Y1(1)=0;
    X2(1)=10*a;
    Y2(1)=-2*a;
    nn=1;

    
  for t=0:det_t:tend
    Fxx=xR-xW;
    Fyy=yR-yW;
    Fzz=sqrt(Fxx^2+Fyy^2);
    if(Fzz<0.2)
        %如果距离小于某值，则输出catch！
        disp('Catch!')
        disp(vW)
        break;
    end
    
    det_yR=det_t*vR;
    yR=yR+det_yR;
    
    s=det_t*vW;
    sxx=(s*Fxx)/Fzz;
    syy=(s*Fyy)/Fzz;
    
    xW=xW+sxx;
    yW=yW+syy;
    
    nn=nn+1;
    X1(nn)=xW;
    Y1(nn)=yW;
    X2(nn)=xR;
    Y2(nn)=yR; 
 end
    
    
    
  
end

