clear all; 
close all;
objdir = 'D:\Documents\homework_5th\deecamp\dataset\images_cartoon_cat\';
outputdir = 'D:\Documents\homework_5th\deecamp\dataset\cat_erode\';
tnum = 2484;
for i = 1:1:tnum
    bgFile = [objdir,int2str(i),'.png'];
	imag = imread(bgFile);
    imag = rgb2gray(imag);
    BW3 = edge(imag,'canny', 0.9);
    se = strel('disk',3);
    I = 1 - imdilate(BW3, se);
    imwrite(I,[outputdir,int2str(i),'.png']);
end