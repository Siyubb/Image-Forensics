
clc;
clear;
tic;
color=imread('copymove.jpg');
result_name='F:\2022 lvjing\picture\000001.jpg';
if size(size(color),2)==3
    im=rgb2gray(color);
else
    im=color;
end
im=single(im);

[f,d] = vl_sift(im) ;
pos=f(1:2,:)';
scale=f(3,:)';
descr=double(d');
count=size(descr,1); %特征点个数
S=[];
D=[];
color=double(color);      

for i=1:size(descr,1) %所有特征点循环
    k=1;       
    distance=zeros(1,(size(descr,1)));
    for j=1:size(descr,1)
        distance(k)=norm(descr(i,:)-descr(j,:));
        k=k+1;
    end
        [distance,position]=sort(distance);
        m=distance(2)/distance(3);
        if (m<0.3) 
            S=[S;pos(i,:)];
            D=[D;pos(position(2),:)];                
        end
end
correctPoints = ransac_stitch(S(:,1),S(:,2),D(:,1),D(:,2));   
figure,imshow(color/256);
hold on;
for i = 1: size(S,1)
% Rif find(correctPoints(:)==i)
    line([S(i,1),D(i,1)], ...
         [S(i,2),D(i,2)], 'Color', 'g','LineWidth',2);
% end
  
end
%plot(pos(:,1)',pos(:,2)','*');
plot(S(:,1)',S(:,2)','*');
plot(D(:,1)',D(:,2)','*');
hold off;


saveas(gcf,result_name)%

match=size(S,1);
toc;
