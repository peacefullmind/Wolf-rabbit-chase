function [flag] = SafeOrNot(xR0,yR0)
%给出一组坐标，判断是否相遇的函数

Ycatch=0;

a=223;

vR=12;
vW=24;

xR=xR0;
yR=yR0;
xW=0;
yW=0;

O=[10*a,4*a];
S_totalR=sqrt((10*a-xR0)^2+(4*a-yR0)^2);
tend=S_totalR/vR;
det_t=0.1;

N=ceil(tend/det_t);
X1=zeros(1,N+10);
Y1=zeros(1,N+10);
X2=zeros(1,N+10);
Y2=zeros(1,N+10);
X1(1)=0;
Y1(1)=0;
X2(1)=xR0;
Y2(1)=yR0;
nn=1;

for t=0:det_t:tend
    Fxx=xR-xW;
    Fyy=yR-yW;
    Fzz=sqrt(Fxx^2+Fyy^2);
    if(Fzz<0.5)
        disp('Catch!')
        Ycatch=1;
        break;
    end
    
    
    RFxx=10*a-xR;
    RFyy=4*a-yR;
    RFzz=sqrt(RFxx^2+RFyy^2);
    det_rr=det_t*vR;
    rxx=(det_rr*RFxx)/RFzz;
    ryy=(det_rr*RFyy)/RFzz;
    xR=xR+rxx;
    yR=yR+ryy;
    
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


flag=Ycatch;
end

