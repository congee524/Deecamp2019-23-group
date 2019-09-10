close all;
clear all;

M = double(1 - rgb2gray(imread('test1.png')));
figure(1),imshow(M);
[F,sx0,sy0]  = randomdeform(M,95,6);
figure(2),imshow(F)