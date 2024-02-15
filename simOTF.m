% function [otf, psf] = simOTF(sizeIm, cutFreq )
%
% sizeIm  array of the number of pixels to generate
% cutFreq maximal frequency contained in the OTF
%
function [otf, psf] = simOTF(sizeIm, cutFreq )

    if( nargin==0 )
       sizeIm = [255 255]; 
    end
    if( nargin<2 )
       cutFreq = 0.2; 
    end
    minOTF = 1e-15; 
    
    h = ifftshift(mPupil( sizeIm, cutFreq/2 ) );
    h = fftn(  abs(ifftn(h)).^2  );
    h = real(h);
    otf = h./h(1,1);    
    otf(abs(otf)<minOTF) = 0;
    if(nargout==2)
        %PSF
       psf = real(ifft2(otf)); 
    end
    
end



