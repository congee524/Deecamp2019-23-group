close all;
clear all;

objdir1 = 'D:\Documents\homework_5th\deecamp\dataset\elephant\outline\';
objdir2 = 'D:\Documents\homework_5th\deecamp\dataset\elephant\Sketch\';
objdir3 = 'D:\Documents\homework_5th\deecamp\dataset\elephant\origin\';
outputdir1 = 'D:\Documents\homework_5th\deecamp\dataset\elephant\outline_combined\';
outputdir2 = 'D:\Documents\homework_5th\deecamp\dataset\elephant\origin_combined\';

tnum = 1154; % modify!!!!!!
% tnum = 10;
se1 = strel('disk',5);
se2 = strel('disk',4);
for i = 1:1:tnum
    bgFile = [objdir3,int2str(i),'.png'];
	imag = imread(bgFile);
    imag = rgb2gray(imag);
%    I=bwmorph(imag,'skel',Inf); 
    BW3 = edge(imag,'canny', 0.88);
    I = imdilate(BW3, se1);
    I = imerode(I, se2);
    I = double(I);
    [F,sx0,sy0]  = randomdeform(I,50,6);
    imwrite(1 - F,[objdir1,int2str(i),'.png']);
end
display('outline done!');

for i = 1:1:tnum
    bgFile1 = [objdir1,int2str(i),'.png'];
    bgFile2 = [objdir2,int2str(i),'.png'];
    bgFile3 = [objdir3,int2str(i),'.png'];
    imag10 = imread(bgFile1);
    imag1 = imresize(cat(3,imag10, imag10, imag10), [256, 256]);
    %imag20 = imread(bgFile2);
    %imag2 = imresize(cat(3,imag20, imag20, imag20), [256, 256]);
    imag2 = imresize(imread(bgFile2), [256, 256]);
    imag3 = imresize(imread(bgFile3), [256, 256]);
    imag_out1 = [imag1, imag2];
    imag_out1 = imresize(imag_out1, [256, 512]);
    imag_out2 = [imag2, imag3];
    imag_out2 = imresize(imag_out2, [256, 512]);
    imwrite(imag_out1,[outputdir1,int2str(i),'.png']);
    imwrite(imag_out2,[outputdir2,int2str(i),'.png']);
end
display('write done!');