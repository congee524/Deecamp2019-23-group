clear all; 
close all;
objdir1 = 'D:\Documents\homework_5th\deecamp\dataset\cat_erode\';
objdir2 = 'D:\Documents\homework_5th\deecamp\dataset\images_cartoon_cat\';
outputdir = 'D:\Documents\homework_5th\deecamp\dataset\cat_data\';
tnum = 2484;
for i = 1:1:tnum
    bgFile1 = [objdir1,int2str(i),'.png'];
    bgFile2 = [objdir2,int2str(i),'.png'];
    imag0 = imread(bgFile1);
    imag1 = cat(3,imag0, imag0, imag0);
    imag2 = imread(bgFile2);
    imag = [imag1, imag2];
    imag = imresize(imag, [256, 512]);
    imwrite(imag,[outputdir,int2str(i),'.png']);
end