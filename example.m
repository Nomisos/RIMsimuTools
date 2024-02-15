close all;
clc;
clear;

lambdaCol = 520; % Collection wavelenght
lambdaIllu = 520; % Illumination wavelenght

curSize = 200*[1 1];% Number of pixel of your camera
pixelSize = 6.5;% Pixel size of your camera in micrometers
magnification = 100;% total magnification from camera to sample plane
NA = 1.33;% NA of your objective

numIllu = 100;% number of illumination simulated
meanIllu = 5;% Average number of photons in the illumination

sigma = 4; % Standard deviation of additive noise (electronic noise, ...)
doPoissonNoise = 1;% Boolean to simulate Poisson noise or not



%% Simulation of the OTFs and PSFs

cutFreqCol = 2*NA*pixelSize*1000/magnification / lambdaCol;% should be between 0 and .5 (See Nyquist criterion)
[otfCol, psfCol] = simOTF(curSize, cutFreqCol);

%If you want to save a PSF image to use with AlgoRIM Interface uncomment
%next line
% imwrite( mNormalize(fftshift(psfCol)) , sprintf("psf_L%03.0f_N%dx%d_ps%05.0f.tif",lambdaCol, curSize, pixelSize*1000/magnification ));


figure;
subplot 131
imagesc( fftshift(otfCol) );
axis square
title("Col OTF");
subplot 132
imagesc( fftshift(psfCol) );
axis square
title("Col PSF");
subplot 133
imagesc( mExtract(fftshift(psfCol) , floor(curSize/5)) );
axis square
title("Col PSF (smaller region)");


%% Simulation of the speckles

cutFreqIllu = 2*NA*pixelSize*1000/magnification / lambdaIllu;% should be between 0 and .5 (See Nyquist criterion)
illu = simSpeckles( curSize, cutFreqIllu, numIllu, meanIllu);


figure;
for i = 1:4
    subplot(2,2,i);
    imagesc( illu(:,:,i) );
    axis square
    title( sprintf("Speckle %d", i));
    colorbar
end


%% Simulation of an object

obj = 1+cos(20*mTheta(curSize)); % simulation of a target object 

figure;
imagesc(obj);
axis square
title("Object");



%% Simulation of RIM images

imgNoNoise = real(ifft2( otfCol .* fft2(obj.*illu) )); % Simulation of noisless RIM images

figure;
for i = 1:4
    subplot(2,2,i);
    imagesc( imgNoNoise(:,:,i) );
    axis square
    title( sprintf("Image %d", i));
    colorbar
end

%% Noise simulation


if(doPoissonNoise)
    imgWithNoise = poissrnd(imgNoNoise) + sqrt(sigma)*randn([curSize numIllu]);
else
    imgWithNoise = imgNoNoise + sqrt(sigma)*randn([curSize numIllu]);
end

figure;
for i = 1:4
    subplot(2,2,i);
    imagesc( imgWithNoise(:,:,i) );
    axis square
    title( sprintf("Noisy image %d", i));
    colorbar
end


%%

