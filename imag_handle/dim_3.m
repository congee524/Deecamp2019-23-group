close all;
clear all;

objdir = 'D:\Documents\homework_5th\deecamp\dataset\final_dataset\out\';
outputdir = 'D:\Documents\homework_5th\deecamp\dataset\final_dataset\outline\';

tnum = 5002;
for i = 1:1:tnum
    bgFile = [objdir,int2str(i),'.png'];
    imag = imread(bgFile);
    tmp = size(imag);
    if tmp(3) ~= 3
        display(i);
    end
end
display('done!');