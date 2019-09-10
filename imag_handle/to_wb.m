close all;
clear all;
imag = imread('test3.png');
figure(1); imshow(imag)
se = strel('disk',1);
I = imdilate(imag, se);
imag = (rgb2gray(I) > 170);


figure(2); imshow(imag);
BW3 = edge(imag,'canny', 0.4);
%se = strel('disk',3);
%I = 1 - imdilate(BW3, se);
figure(3);
imshow(BW3);