close all, clear all, clc
nc=4;
a = 0:359;
x=cosd(a);
y=sind(a);
[px,py] = meshgrid(1:nc);
nc=numel(px);
cm=jet(nc);
r=0.5*rand(nc,1);
for i=1:nc
    patch(px(i)+rand+r(i)*x, py(i)+rand+r(i)*y, cm(i,:));
end 

axis equal;