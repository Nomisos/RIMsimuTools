function test_mXX_mYY_mZZ(  )
    
    testRes = mXX( [5 1] );
    assert( isequal( testRes ,  (-2:2)'  ));

	testRes = mXX( [1 5] );
    assert( isequal( testRes ,  zeros(1, 5)  ));

    
    testRes = mXX( [6 1] );
    assert( isequal( testRes ,  (-3:2)'  ));
    
    testRes = mXX( [5 5] );
    assert( isequal( testRes ,  (-2:2)' * ones(1,5)  ));

    testRes = mXX( [5 5], 'freq' );
    assert( norm( testRes -  (-2:2)' * ones(1,5) /5 ) < 1e-16);

    testRes = mXX( [6 6], 'freq' );
    assert( isequal( testRes ,  (-3:2)' * ones(1,6) /6 ));

    
    
	testRes = mYY( [1 5] );
    assert( isequal( testRes ,  (-2:2)  ));

    testRes = mYY( [6 1] );
    assert( isequal( testRes ,  zeros(6,1)  ));

    testRes = mYY( [1 6] );
    assert( isequal( testRes ,  (-3:2)  ));

    

end
