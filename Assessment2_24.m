% 01.
% image1 = imread('image 1.jpg');
% 
% %Seperate RGB Channels
% R = image1(:,:,1);
% G = image1(:,:,2);
% B = image1(:,:,3);
% 
% %Convert to Grauscale Using the weighted method
% gimage = 0.2989*R+0.5870*G+0.1140*B;
% 
% % Display the images
% subplot(2,2,1),imshow(R),title('Red Channel');
% subplot(2,2,2),imshow(G),title('Green Channel');
% subplot(2,2,3),imshow(B),title('Blue Channel');
% subplot(2,2,4),imshow(gimage),title('Grayscale Image');
% 
% %Save the grayscale image
% imwrite(gimage,'gray_image 1.jpg');

%02.

% image2 = imread('image 2.jpg');
% 
% % Obtain the negative image
% negativeImage = 255 - image2;
% 
% % Flip the image
% flippedNegativeImage = flip(negativeImage, 2);
% 
% % Smoothen the image
% smoothenedImage = imgaussfilt(flippedNegativeImage, 2);
% 
% % Display the images
% 
% subplot(1,3,1), imshow(image2), title('Original Image');
% subplot(1,3,2), imshow(flippedNegativeImage), title('Flipped Negative Image');
% subplot(1,3,3), imshow(smoothenedImage), title('Smoothened Image');

%03.

% image3 = imread('image 3.png');
% image4 = imread('image 4.png');
% 
% % Convert images to grayscale
% grayImage3 = rgb2gray(image3);
% grayImage4 = rgb2gray(image4);
% 
% % Subtract the images to highlight differences
% diffImage = imabsdiff(grayImage3, grayImage4);
% 
% % Threshold the difference image to segment the tumor
% binaryImage = imbinarize(diffImage, 'adaptive', 'Sensitivity', 0.4);
% 
% % Display the images
% 
% subplot(1,3,1), imshow(grayImage3), title('Image 3');
% subplot(1,3,2), imshow(grayImage4), title('Image 4');
% subplot(1,3,3), imshow(binaryImage), title('Detected Tumor');

%04.

% bg = imread('image 5.jpg');
% fg = imread('image 6.tif');
% 
% % Resize the background to match the size of the foreground
% bg = imresize(bg, [size(fg, 1) size(bg,2)]);
% 
% % Replace the background
% outputImage = imadd(fg, bg);
% 
% % Decrease the brightness
% outputImage = imadjust(outputImage, [], [0, 0.5]);
% 
% % Display the images
% 
% subplot(1,3,1), imshow(fg), title('Foreground Image');
% subplot(1,3,2), imshow(bg), title('Background Image');
% subplot(1,3,3), imshow(outputImage), title('Output Image with Decreased Brightness');

%05.

% image7 = imread('image 7.jpg');
% 
% % Apply log transformation
% c = 3;
% logTransformed = c * log(1 + double(image7));
% 
% % Normalize to the range 0-255
% logTransformed = uint8(255 * mat2gray(logTransformed));
% 
% % Zoom the image
% zoomedImage = imresize(logTransformed, 2, 'bilinear');
% 
% % Display the images
% 
% subplot(1,2,1), imshow(logTransformed), title('Log Transformed Image');
% subplot(1,2,2), imshow(zoomedImage), title('Zoomed Image');

%06.

% image8 = imread('image 8.jfif');
% 
% % Apply power law transformation with ? = 0.5
% c = 2;
% gamma1 = 0.5;
% powerLaw1 = c * (double(image8) .^ gamma1);
% powerLaw1 = uint8(255 * mat2gray(powerLaw1));
% 
% % Apply power law transformation with ? = 3
% gamma2 = 3;
% powerLaw2 = c * (double(image8) .^ gamma2);
% powerLaw2 = uint8(255 * mat2gray(powerLaw2));
% 
% % Display the images
% 
% subplot(1,3,1), imshow(image8), title('Original Image');
% subplot(1,3,2), imshow(powerLaw1), title('Power Law (?=0.5)');
% subplot(1,3,3), imshow(powerLaw2), title('Power Law (?=3)');

%07.

% image9 = imread('image 9.jpg');
% % Enhance the image using histogram equalization
% enhancedImage = histeq(image9);
% 
% % Display the images
% 
% subplot(1,2,1), imshow(image9), title('Original Image');
% subplot(1,2,2), imshow(enhancedImage), title('Enhanced Image');

%08.

% image10 = imread('image 10.jpg');
% 
% %Compute the Hostograms
% 
% originalHist = imhist(image10);
% equalizedImage = histeq(image10);
% equalizedHist = imhist(equalizedImage);
% 
% %Display Images & Histograms
% 
% subplot(2,2,1), imshow(image10), title('Original Image');
% subplot(2,2,2), bar(originalHist), title('Original Histogram');
% subplot(2,2,3), imshow(equalizedImage), title('Equalized Image');
% subplot(2,2,4), bar(equalizedHist), title('Equalized Histogram');

%09.
% 
% image11 = imread('image 11.png');
% 
% % Identify the noise (e.g., salt & pepper noise)
% noisyImage = imnoise(image11, 'salt & pepper', 0.02);
% 
% % Remove the noise using a median filter
% denoisedImage = medfilt2(rgb2gray(noisyImage));
% 
% % Display the images
% 
% subplot(1,3,1), imshow(image11), title('Original Image');
% subplot(1,3,2), imshow(noisyImage), title('Noisy Image');
% subplot(1,3,3), imshow(denoisedImage), title('Denoised Image');

%10.

% image12 = imread('image 12.jpg');
% 
% % Sharpen the image
% sharpenedImage = imsharpen(image12);
% 
% % Detect edges using the Canny method
% edges = edge(rgb2gray(image12), 'Canny');
% 
% % Display the images
% figure;
% subplot(1,3,1), imshow(image12), title('Original Image');
% subplot(1,3,2), imshow(sharpenedImage), title('Sharpened Image');
% subplot(1,3,3), imshow(edges), title('Edges');
