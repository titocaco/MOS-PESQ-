%%%%%%%%%%%%%%%%%%%%统计QQ语音通话质量%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%kingma-----2015-9-2%%%%%%%%%%%%%%%%%%%%%%

% clc
% clear all
% close all
%%
function [code,PESQ,X,Y] = read(traindir, n)     
% number of files
PESQ=zeros(1,480);
X=zeros(1,480);
Y=zeros(1,480);
for i = 1:n                      
    file = sprintf('%s%d.wav', traindir, i);           
    disp(file);
    s = wavread(file); 
    if(i<=120)
         p=composite('英文男连续.wav',file);
         [x1,y1]=vad(s);
         PESQ(i)=p;
         X(i)=x1;
         Y(i)=y1;
%     elseif(i<=240)
%          p=composite('英文女连续.wav',file);
%          [x1,y1]=vad(s);
%          PESQ(i)=p;
%          X(i)=x1;
%          Y(i)=y1;
%     elseif(i<=360)
%          p=composite('中文男连续.wav',file);
%          [x1,y1]=vad(s);
%          PESQ(i)=p;
%          X(i)=x1;
%          Y(i)=y1;
%     elseif(i<=480)
%          p=composite('中文女连续.wav',file);
%          [x1,y1]=vad(s);
%          PESQ(i)=p;
%          X(i)=x1;
%          Y(i)=y1;
    end
         code(:,i) = s(:,1);
 
end

%%