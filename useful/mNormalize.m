function out = mNormalize( in )

    in = double(in);

    vMax = max(in(:));
    vMin = min(in(:));

    if(vMax>vMin)
        out = (in - vMin) ./ (vMax-vMin);
    else
        out = ones(size(in));
    end


end