close all;
clear all;

input_dir1 = 'D:\Documents\homework_5th\deecamp\dataset\other_data\dataset_total\';
input_dir2 = 'D:\Documents\homework_5th\deecamp\dataset\other_data\total_outline\';
output_dir = 'D:\Documents\homework_5th\deecamp\dataset\other_data\total_combined\';

tnum = 2138;
% tnum = 4;

for i = 1 : tnum
    bgFile = [input_dir1, int2str(i),'.png'];
    imag1 = imread(bgFile);
	imag2 = rgb2gray(imag1);
    imag2 = 1 - edge(imag2,'canny', 0.05);
    imwrite(imag2, [input_dir2,int2str(i),'.png']);
    bgFile = [input_dir2, int2str(i),'.png'];
    imag2 = imread(bgFile);
%     if isa(imag2, 'logical')
%         imag2 = 255 * imag2;
%     end
    imag = [cat(3, imag2, imag2, imag2), imag1];
    imwrite(imag, [output_dir,int2str(i),'.png'] )
end

% for i = 1 : tnum
%     bgFile = [input_dir1, int2str(i),'.png'];
%     imag1 = imread(bgFile);
%     imag2 = im2bw(imag1, 0.2);
%     imwrite(imag2, [input_dir2,int2str(i),'.png']);
%     bgFile = [input_dir2, int2str(i),'.png'];
%     imag2 = imread(bgFile);
%     imag = [cat(3, imag2, imag2, imag2), imag1];
%     imwrite(imag, [output_dir,int2str(i),'.png'] )
% end

disp('done!');