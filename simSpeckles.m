% function [illu, field, Xs ] = simSpeckles( sizeIm, cutFreq, numIllu, i0)
%
% sizeIm  array of the number of pixels to generate
% cutFreq maximal frequency contained in the intensity speckles
% numIllu number of speckles to generate
% meanIllu average intensity of the generated speckles
%
function [illu, field, X ] = simSpeckles( sizeIm, cutFreq, numIllu, meanIllu)
   
   if( nargin < 4)
       meanIllu = 1;
   end

   curFilter = ifftshift (mPupil( sizeIm, cutFreq/2 ));    
    
   %% calc illu
       
    fact = meanIllu * numel(curFilter) / ( 2*sum( abs( curFilter(:) ).^2) );             
    X = sqrt(fact)*(randn([sizeIm numIllu]) + 1j * randn([sizeIm numIllu]));
    field = ifft2( fft2(X) .* curFilter);
    illu = abs(field).^2;
   
        
end

