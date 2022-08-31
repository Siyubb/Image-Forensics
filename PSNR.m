
im=imread('splicing2.jpg');  
 imwrite(im,'replacement1.jpg','jpeg','Quality',95);
    replacefile1 = imread('replacement1.jpg');

    multiplier=28;
        diff2 =uint8(abs(double(im)-double(replacefile1))*multiplier);
        intensity= max(max(max(diff2)));
        diff2= uint8(double(diff2)*255/double(intensity));
        [peaksnr,snr]=psnr(im,diff2);
        P(1,multiplier)=peaksnr;
        diff2=double(diff2(:));
        ima=max(diff2(:));
        imi=min(diff2(:));
        ims=std(diff2(:));
        SNR(1,multiplier)=20*log10((ima-imi)./ims);
    end
subplot(2,1,1)
plot(1:multiplier,P,'r');
legend('PSNR')
subplot(2,1,2)
plot(1:multiplier,SNR,'b')
legend('SNR')