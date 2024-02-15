function [theta] = mTheta( curSize )
    
    X = mXX( curSize );
    Y = mYY( curSize );
    theta = atan2( Y , X );
    
end

