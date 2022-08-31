
% Calculating Luminosity of RGB channel of Entire image.
% Here the luminosity is the intensity of 
% Red green and blue of all the pixels 
% in the entire image is calculated. 
% The entire image is iterated and 
% maximum value is retrieved from the RGB vectors of Image. 
 
    im=imread('manipulated2.jpg');  
 imwrite(im,'replacement1.jpg','jpeg','Quality',95);
    replacefile1 = imread('replacement1.jpg');
multiplier=30;
    diff = uint8(abs(double(im)-double(replacefile1))*multiplier);
    intensity = max(max(max(diff)));
    diff = uint8(double(diff)*255/double(intensity));
    R1 = diff(:,:,1);
    G1 = diff(:,:,2);
    B1 = diff(:,:,3);
   lum = 0.299*R1+0.587*G1+0.114*B1;
    answer1 = max(lum(:));
    disp(answer1);

    figure;
   imshow(im);
   title('original image');
   figure;
   imshow(ed);
   title('ELA result');


      %Morphological operation dilation followed by erosion%
    se = strel('disk',1);
    contrastfiltered =(im-imbothat(diff,se)); %Returns the image minus the morphological closing of the image%
    Ml= double(contrastfiltered);
    
    figure; 
    subplot(1,2,1)
    imshow(diff);
     title('ELA result'); 
    subplot(1,2,2)
    imshow(Ml);
     title('Morphological operation result');
    
    
    BW2 = bwmorph(255*double(rgb2gray(im)),'remove');
    
    figure;
    subplot(1,2,1)
    imshow(diff);
     title('ELA result'); 
    subplot(1,2,2)
    imshow(BW2); 
     title('remove result');
    
    
    destinationFolder = 'C:\Users\李贵雄\Desktop\Results';
    if ~exist(destinationFolder,'dir')
        mkdir(destinationFolder,'dir');
    end
    
    
    
    
