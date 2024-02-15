function test_mRamp(  )


testRes = mRamp( [5 1] , 1 , 'coord' );
assert( isequal( testRes ,  (1:5)'  ));

testRes = mRamp( [5 1] , 1 );
assert( isequal( testRes ,  (-2:2)'  ));

testRes = mRamp( [5 1] , 1 , 'freq' );
assert( norm( testRes -  (-.4:.2:.4)'  ) <1e-14 );

testRes = mRamp( [6 1] , 1 );
assert( isequal( testRes ,  (-3:2)'  ));

testRes = mRamp( [6 6] , 1 );
assert( isequal( testRes ,  (-3:2)' * ones(1,6)  ));

testRes = mRamp( [3 3 3] , 1 );
testRep = repmat( [-1 -1 -1 ; 0 0 0 ; 1 1 1] , [1 1 3] );
assert( isequal( testRes ,  testRep ));

testRes = mRamp( [3 3 3] , 2 );
testRep = repmat( [-1 0 1 ; -1 0 1; -1 0 1] , [1 1 3] );
assert( isequal( testRes ,  testRep ));


testRes = mRamp( [3 3 3] , 3 );
testRep = cat(3, -ones(3) , zeros(3) , ones(3) );
assert( isequal( testRes ,  testRep ));



end
