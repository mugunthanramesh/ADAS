function map_cv(dist,score)
%pause(2);
map = robotics.OccupancyGrid(111,115); % Grid Size
count=0;
%getFile(mypi,'sense.csv')
%a = csvread('sense.csv');
%a = a(end,:);
%a = a.*10;
%a = round(a);
%a(a>50)=50;
clear car3 car4 car1 car2 car5 car6;
x=50:61;
y=50:65;
clc;
count=1;
for i=1:1:11
    for j=1:1:15
    car3(count)=x(i);
    car4(count)=y(j);
    count=count+1;
    end
end
x=50:61;
y=50:65;
clc;
count=1;
for i=1:1:12
    for j=1:1:15
    car6(count)=x(i);
    car5(count)=y(j);
car1=[car3;car4]';
    count=count+1;
    end
end
car=[car5;car6]';% Reference car
ranges =  dist;%15*randi(11,1,10)% Ultrasonic data
angles = linspace(-pi, pi, 10);
maxrange = 150;
%insertRay(map,[255,255,0],ranges,angles,maxrange);
show(map)
xcoord=ranges.*cos(angles);
ycoord=ranges.*sin(angles);
updateOccupancy(map,car,1);
show(map)
% confidence value
for i=1:1:9
car2=[xcoord(i)+car3;ycoord(i)+car4]';
if((i<4))
    cv = score(1);
end
if(i>3 && i<6)
    cv = score(2);
end
if(i>5 && i<9)
    cv = score(3);
end
if(i>8 && i<11)
    cv = score(4);
end
updateOccupancy(map,car2,cv);
show(map);
end
%for i=1:1:9
%text(xcoord(i)+50,ycoord(i)+50,num2str(ranges(i)));
end