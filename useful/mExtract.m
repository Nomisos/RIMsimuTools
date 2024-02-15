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
%   File: mExtract.m
%   Name: Simon Labouesse
%   Date: 01/02/2018
%
%
%function out = mExtract(in, sizeOut, pos, val)
%
function out = mExtract(in, sizeOut, pos, val)

    curNumDims = max(ndims(in),numel(sizeOut) );

    if(nargin<2)
        out = in;
        return;
    end
    if(nargin<3 || isequal( pos,[] ) ) 
        pos =  zeros( 1 ,curNumDims);
    end
    assert( isequal(numel(pos), numel(sizeOut)) , sprintf('pos should be a vector of size (%d,1)', numel(sizeOut))  );


    if(nargin<4)
        val = 0;
    end
    
    
    %size
    s1 = size(in);
    s1(end+1 : curNumDims) = 1;
    s2 = sizeOut;
    s2(end+1 : curNumDims) = 1;
    
    pos(end+1 : curNumDims) = 1;
    
    %center pos
    c1 = floor(s1/2)+1;
    c2 = floor(s2/2)+1;
       
    %size overruns
    t = [c1-1;s1-c1] -  [c2-1;s2-c2] + [pos ; -pos];
    t1=t;
    t2=-t;
    t1(t1>0) = 0;
    t2(t2>0) = 0;
    s = s1 - sum(t,1);
    out = zeros(s)+val;

    strIdOut = '';
    strIdIn = '';
    for i =1:curNumDims
        if(i>1)
            strIdOut = [strIdOut ' , '];
            strIdIn = [strIdIn ' , '];
         end
       strIdOut = [strIdOut num2str(1-t1(1,i)) ':' num2str(size(out,i) + t1(2,i)) ''   ];
       strIdIn = [strIdIn num2str(1-t2(1,i)) ':' num2str( size(in,i) + t2(2,i)) ''   ];
    end
    
    eval( [ 'out('  strIdOut  ') = in( '  strIdIn   ');' ]);
    

end