%第3问 情景2
clear;clc;
flag=0;%表示狼没有达到水池
a=223;
R=[10*a,-2*a];
O=[10*a,4*a];
vR=12;
vW=26;

xR=10*a;
yR=-2*a;
xW=0;
yW=0;
tE=4*a/vR;%兔子到达E点的时刻
Oss=pi*a;%半圆的周长
T=Oss/vR;%兔子绕半圆的时间
tF=tE+T/2;
tB=tE+T;%兔子到达巢穴的时刻
det_t=0.1;

N=ceil(tB/det_t);
X1=zeros(1,N+10);
Y1=zeros(1,N+10);
X2=zeros(1,N+10);
Y2=zeros(1,N+10);
X1(1)=0;
Y1(1)=0;
X2(1)=10*a;
Y2(1)=-2*a;
nn=1;

for t=0:det_t:tE
    Fxx=xR-xW;
    Fyy=yR-yW;
    Fzz=sqrt(Fxx^2+Fyy^2);
    if(Fzz<0.1)
         disp('Catch!')
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

xRE=xR;
yRE=yR;

for t=tE:det_t:tB
    Fxx=xR-xW;
    Fyy=yR-yW;
    Fzz=sqrt(Fxx^2+Fyy^2);
    if(Fzz<0.2)
        disp('Catch!')
        break;
    end
  
    
    td=t-tE;
    theta=td/T*pi;
    
    xR=xRE+a*sin(theta);
    yR=yRE+a-a*cos(theta);
      
   
    
    %圆心坐标（10a,3a）
    dss=sqrt((xW-10*a)^2+(yW-3*a)^2);
    
    if(((dss-a)<0.1)&&(flag==0))
        disp('狼到达水池边')
        %狼到达水池的点记作P
        %求解狼到达水池的坐标
        xWP=xW;
        yWP=yW;
        tP=t;
        %求解狼到达水池时，相对于E点的角度jd0
        jd0=acos((yRE+a-yWP)/a);
        flag=1;

    end
    
    if(flag==0)%狼没有到达水池的情况下，狼的坐标的更新方法
        s=det_t*vW;
        sxx=(s*Fxx)/Fzz;
        syy=(s*Fyy)/Fzz;

        xW=xW+sxx;
        yW=yW+syy;
    else
        trun=t-tP;%狼绕水池的时间
        srun=trun*vW;%狼绕水池的距离
        jdrun=(srun/Oss)*pi;%狼相对于P点的角度
        jd=jd0+jdrun;%狼相对于E点的角度
%         disp('================')
%         disp(jd)
%         disp(jd/pi*180)
%         disp(xW-10*a)
%         disp(yW-2*a)
        if(jd>theta)
            disp('Catch')
            break
        end
        xW=xRE+a*sin(jd);
        yW=yRE+a-a*cos(jd);
        
        
    end

    
    nn=nn+1;
    X1(nn)=xW;
    Y1(nn)=yW;
    X2(nn)=xR;
    Y2(nn)=yR; 
   
    
    
end


plot(X1,Y1,'*',X2,Y2,'o')
disp(xW)
disp(yW)