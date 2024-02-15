function test_mNormalize()

    testRes = mNormalize( [6 6] );
    assert( isequal( testRes, [ 1 1 ]  ) ) ;
    testRes = mNormalize( [6 4] );
    assert( isequal( testRes, [ 1 0]  ) ) ;
    testRes = mNormalize( [4 6] );
    assert( isequal( testRes, [ 0 1 ]  ) ) ;

    
    testRes = mNormalize( [6 6, 2 3] );
    assert( isequal( testRes, [ 1 1 0 .25 ]  ) ) ;

end




