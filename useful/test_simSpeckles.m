function test_simSpeckles()

    testRes = simSpeckles([5 5], .2, 10);
    assert( isequal( size(testRes), [5 5 10]  ) ) ;

end




