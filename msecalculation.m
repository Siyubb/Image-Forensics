im=imread('original1.jpg');
imwrite(im,'replacement1.jpg','jpeg','Quality',75);
replacefile1 = imread('replacement1.jpg');

[rows,columns,~] = size(im);

% Calculate mean square error of R, G, B.   
mseRImage = (double(im(:,:,1)) - double(replacefile1(:,:,1))) .^ 2;
mseGImage = (double(im(:,:,2)) - double(replacefile1(:,:,2))) .^ 2;
mseBImage = (double(im(:,:,3)) - double(replacefile1(:,:,3))) .^ 2;

mseR = sum(sum(mseRImage)) / (rows * columns);
mseG = sum(sum(mseGImage)) / (rows * columns);
mseB = sum(sum(mseBImage)) / (rows * columns);

% Average mean square error of R, G, B.
mse = (mseR + mseG + mseB)/3;
fprintf('\n The mse value is %0.4f \n', mse);