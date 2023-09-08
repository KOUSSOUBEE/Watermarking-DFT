clc;
clear all;
close all;
% Charger l'image hôte et l'image à tatouer
image_hote = imread('im1.png');
image_hote = rgb2gray(image_hote);
image_hote = double(image_hote);

tatouage = imread('qr.jpg');
tatouage = rgb2gray(tatouage);
tatouage = double(tatouage);
tatouage = im2bw(tatouage);
tatouage = imresize(tatouage, size(image_hote));

% Appliquer la DFT à l'image hote et a la marque
dft_hote = fft2(image_hote);
dft_tatouage = fft2(tatouage);

% Définir un facteur de visiblité
facteur_embedding = 0.001;

% Tatouer l'image secrète dans les coefficients DFT de l'image de couverture

dft_imwat = dft_hote + facteur_embedding * dft_tatouage;

% Inverser la DFT pour obtenir l'image tatouée
image_tatouee = ifft2(dft_imwat);

% Convertir l'image résultante en valeurs entre 0 et 255
I = uint8(image_tatouee);
image_tatouee = uint8(abs(image_tatouee));

% Afficher l'image tatouée
%imshow(image_tatouee);
imshow(I);
