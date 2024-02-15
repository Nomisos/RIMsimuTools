function test_mExtract(  )

    testRes = mExtract( ones(10,1) , [5 1] );
    assert( isequal( testRes ,  ones(5,1)));

	testRes = mExtract( ones(3,1) , [5 1] );
    assert( isequal( testRes ,  [0 1 1 1 0]' ));

    testRes = mExtract( ones(3,1) , [4 1] );
    assert( isequal( testRes ,  [0 1 1 1]' ));

    
    testRes = mExtract( ones(1,10) , [1 5] );
    assert( isequal( testRes ,  ones(1,5)));
    
    testRes = mExtract( ones(10,10,10) , [5 5  1] );
    assert( isequal( testRes ,  ones(5,5,1)));
    
    testRes = mExtract( ones(10,4,10) , [5 5  1] );
    assert( isequal( testRes ,  [ ones(5,4) zeros(5,1)] ));
    
    testRes = mExtract( ones(10,10,10) , [5 5  5] );
    assert( isequal( testRes ,  ones(5,5,5) ));
    
    
end

