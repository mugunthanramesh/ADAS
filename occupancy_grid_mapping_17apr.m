clc;
clear all;
close all;
%mypi=raspi('169.254.223.244','pi','tech');
%pause(2);
map = robotics.BinaryOccupancyGrid(511,515); % Grid Size
count=0;
%getFile(mypi,'sense.csv');
%a = csvread('sense.csv');
%a = a(end,:);
%a = a.*10;
%a = round(a);
a = [45 50 50 50 50 50 50 50 50 50];
a(a>50)=50;
clear car3 car4 car1 car2 car5 car6;
x=250:261;
y=250:265;
clc;
count=1;
for i=1:1:11
    for j=1:1:15
    car3(count)=x(i);
    car4(count)=y(j);
    count=count+1;
    end
end 
car1=[car3;car4]';
x=250:262;
y=250:265;
clc;
count=1;
for i=1:1:12
    for j=1:1:15
    car6(count)=x(i);
    car5(count)=y(j);
    count=count+1;
    end
end
car=[car5;car6]';% Reference car
ranges =  a;%15*randi(11,1,10)% Ultrasonic data
angles = linspace(-pi, pi, 10);
maxrange = 250;
%insertRay(map,[255,255,0],ranges,angles,maxrange);
show(map)
xcoord=ranges.*cos(angles);
ycoord=ranges.*sin(angles);
setOccupancy(map,car,1);
show(map)