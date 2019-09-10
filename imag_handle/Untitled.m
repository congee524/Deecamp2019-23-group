close all;
clear all;

input_dir = 'D:\Documents\homework_5th\deecamp\project\imag_handle\tmp_in\';
output_dir = 'D:\Documents\homework_5th\deecamp\project\imag_handle\ttt\';

tnum = 60;
% tnum = 10;

for i = 1 : tnum
    bgFile = [input_dir, int2str(i),'.png'];
    imag1 = imread(bgFile);
    w = fspecial('laplacian',0);  
    imag2 = imfilter(imag1,w,'replicate');  
    imag =imag1 - imag2;
    imwrite(imag, [output_dir,int2str(i),'.png'] )
end

% for i = 1 : tnum
%     bgFile = [input_dir, int2str(i),'.png'];
%     imag1 = imread(bgFile);
%     imag2 = double(imag1) / 255;
%     w = 5;
%     sigma = [3, 0.1];
%     imag3 = bfilter2(imag2, w, sigma);
%     imwrite(imag3, [output_dir,int2str(i),'.png'] )
% end

% for i = 1 : tnum
%     bgFile = [input_dir, int2str(i),'.png'];
%     imag1 = imread(bgFile);
%     imag2 = imag1;
%     imag2(imag1 > 250) = 125;
%     imag3 = histeq(imag2);
%     imag3(imag1 > 250) = 255;    
%     imwrite(imag3, [output_dir,int2str(i),'.png'] )
% end

disp('done');