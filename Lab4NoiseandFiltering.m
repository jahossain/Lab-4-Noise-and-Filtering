%% Lab 4: Noise and Filtering
close all; clear; clc;

%% Load and prepare the image
I = im2double(rgb2gray(imread('peppers.png')));

%% 1) Add different noise types
I_gauss = imnoise(I, 'gaussian', 0, 0.01);       % Gaussian noise
I_sp    = imnoise(I, 'salt & pepper', 0.05);     % Salt & Pepper noise

figure;
montage({I, I_gauss, I_sp}, 'Size', [1 3]);
title('Original | Gaussian Noise | Salt & Pepper Noise');

%% 2) Compute simple quality metrics (MSE)
MSE_gauss = immse(I_gauss, I);
MSE_sp    = immse(I_sp, I);

fprintf('MSE (Gaussian Noise): %.4f\n', MSE_gauss);
fprintf('MSE (Salt & Pepper Noise): %.4f\n', MSE_sp);

%% 3) Linear filtering (mean + Gaussian)
h_avg = fspecial('average', 3);   % 3x3 averaging kernel

I_avg_gauss = imfilter(I_gauss, h_avg, 'replicate');
I_avg_sp    = imfilter(I_sp,    h_avg, 'replicate');

h_gauss = fspecial('gaussian', [3 3], 0.7);  % Gaussian kernel
I_gauss_gauss = imfilter(I_gauss, h_gauss, 'replicate');

%% 4) Non-linear filtering (median filter)
I_med_gauss = medfilt2(I_gauss, [3 3]);
I_med_sp    = medfilt2(I_sp,    [3 3]);

figure;
montage({I_avg_sp, I_med_sp, I_avg_gauss, I_med_gauss}, 'Size', [2 2]);
title('Top: Avg vs Median (S&P) | Bottom: Avg vs Median (Gaussian)');

%% 5) Compare metrics after filtering
MSE_avg_sp = immse(I_avg_sp, I);
MSE_med_sp = immse(I_med_sp, I);

fprintf('After filtering (Salt & Pepper): Avg MSE = %.4f | Median MSE = %.4f\n', ...
        MSE_avg_sp, MSE_med_sp);

%% 6) Reflections (write in GitHub)
% - Median filter is best for removing salt & pepper noise because it removes isolated pixels.
% - Linear filters blur edges since averaging smooths intensity transitions.
% - Adaptive filters can preserve edges by adjusting filter strength based on local variance.

