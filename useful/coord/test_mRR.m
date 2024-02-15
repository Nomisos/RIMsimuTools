%
function test_mRR(  )

    testRes = mRR( [5 1]  );
    assert( isequal( testRes ,  abs(-2:2)'  ));
    testRes = mRR( [1 5]  );
    assert( isequal( testRes ,  abs(-2:2)  ));
    
    testRes = mRR( [1 1]  );
    assert( isequal( testRes ,  0  ));
    
    testRes = mRR( [2 2]  );
    assert( isequal( testRes ,  [ sqrt(2) 1 ; 1  0   ]   ));

    testRes = mRR( [3 3]  );
    assert( isequal( testRes ,  [ sqrt(2) 1 sqrt(2) ; 1  0  1 ; sqrt(2) 1 sqrt(2) ]   ));

    testRes = mRR( [2 2 2]  );    
    assert( isequal( testRes , cat(3, [ sqrt(3) sqrt(2) ; sqrt(2)  1   ] , [ sqrt(2) 1 ; 1  0   ])     ));

    testRes = mRR( [3 3 3]  );    
    testRep =  cat(3, [ sqrt(3) sqrt(2) sqrt(3) ; sqrt(2)  1 sqrt(2)  ;  sqrt(3) sqrt(2) sqrt(3) ] ,...
                      [ sqrt(2) 1 sqrt(2) ; 1  0 1 ; sqrt(2) 1 sqrt(2)   ]   ,...
                      [ sqrt(3) sqrt(2) sqrt(3) ; sqrt(2)  1 sqrt(2)  ;  sqrt(3) sqrt(2) sqrt(3) ]  );
    assert( isequal( testRes ,  testRep ));

	testRes = mRR( [2 2] , 'freq' );
    assert( isequal( testRes ,  [ sqrt(2) 1 ; 1  0   ] /2  ));
	testRes = mRR( [3 3] , 'freq' );
    assert( norm( testRes -  [ sqrt(2) 1 sqrt(2) ; 1  0  1 ; sqrt(2) 1 sqrt(2) ]/3   ) <1e-15 );

    testRes = mRR( [3 2]  );
    assert( isequal( testRes ,  [ sqrt(2) 1 ; 1  0  ; sqrt(2) 1  ]   ));
%     testRes = mRR( [3 2] , 'freq' );
%     assert( isequal( testRes ,  [ sqrt(2) 1 ; 1  0  ; sqrt(2) 1  ] / 2  ));


    
end
