function f = myImClose(A,B)
    f = erison(dilation(A,B),B);
end