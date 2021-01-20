clc;
clear all;
close all
mypi=raspi('169.254.223.244','pi','tech');
fprintf("Rasperry pi Connected.....!");
load('E:\Techgium\dec.mat','detector');
camera_data(mypi,detector);