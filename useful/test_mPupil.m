function test_mPupil(  )

    testRes = mPupil( [4,1] , .2 );
    assert( isequal( testRes ,  [0 0 1 0]' ));

    testRes = mPupil( [4,1] , .25 );
    assert( isequal( testRes ,  [0 1 1 1]' ));
    
    testRes = mPupil( [3,3] , .25 );
    assert( isequal( testRes ,  [0 0 0 ; 0 1 0 ; 0 0 0] ));

    testRes = mPupil( [5,5] , .25 );
    assert( isequal( testRes ,  [0 0 0 0 0 ; 0 0 1 0 0 ; 0 1 1 1 0 ; 0 0 1 0 0 ; 0 0 0 0 0] ));

	testRes = mPupil( [3,5] , .25 );
    assert( isequal( testRes ,  [0 0 0 0 0 ; 0 1 1 1 0 ; 0 0 0 0 0] ));

    testRes = mPupil( [3,3,3] , .25 );
    assert( isequal( testRes , cat(3,zeros(3), [0 0 0 ; 0 1 0 ; 0 0 0] , zeros(3) )));


    testRes = mPupil( [3,4,5] , .25 );
    testRes = mPupil( [5,5,5] , .25 );
    
    
    
end

