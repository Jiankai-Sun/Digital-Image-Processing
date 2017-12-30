function f = myImOpen(A,B)
    f = myDilate(myErode(A,B),B);
end