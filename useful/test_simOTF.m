function test_simOTF()

    testRes = simOTF([5 5], .2);
    assert( isequal( size(testRes), [5 5]  ) ) ;

end




