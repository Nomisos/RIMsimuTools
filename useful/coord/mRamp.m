%   Copyright (c) <2019> <Simon Labouesse>
%   
%   Permission is hereby granted, free of charge, to any person obtaining a copy
%   of this software and associated documentation files (the "Software"), to deal
%   in the Software without restriction, including without limitation the rights
%   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
%   copies of the Software, and to permit persons to whom the Software is
%   furnished to do so, subject to the following conditions:
%   
%   The above copyright notice and this permission notice shall be included in all
%   copies or substantial portions of the Software.
%   
%   THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
%   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
%   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
%   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
%   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
%   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
%   SOFTWARE.
%
%
%
%   File: mRamp3D.m
%   Name: Simon Labouesse
%   Date: 01/02/2018
%
%
%function [ out ] = mRamp( sizeIm, dir , methods)
%
function [ out ] = mRamp( sizeIm, dir    , methods)
    
    curNumDims = numel(sizeIm);

    if(nargin<2)
       dir=1; 
    end
    if(nargin<3)
       methods = 'norm'; 
    end
    if(dir>numel(sizeIm))
       out = zeros(sizeIm);
       return;
    end
                
    n = sizeIm(dir);
    vMax =  floor((n-1)/2);
    vMin = -floor((n  )/2);
    temp = vMin:vMax;
    if(vMin~=0)
        switch(methods)                
            case 'freq'
%                 temp = temp / (-2*vMin);
                temp = temp / n;
            case 'coord'
                temp = temp - vMin + 1;
        end
    end
    tempVectA = ones(1, curNumDims);
    tempVectA(dir) = n;
    tempVectB = sizeIm;
    tempVectB(dir) = 1;
    
    out = repmat(reshape(temp,tempVectA),tempVectB );
    
end

