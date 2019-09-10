% datapath = "D:\Documents\homework_5th\deecamp\dataset\downloads\pig";
close all; 
clear all; 
clc;

% Read grayscale image into the workspace
I = rgb2gray(imread('test3.png')); 

% Convert grayscale image to binary image using local adaptive thresholding
BW = imbinarize(I);

% Calculate boundaries of regions in image and overlay the boundaries on the image
B = bwboundaries(BW, 'noholes'); 
imshow(BW); 