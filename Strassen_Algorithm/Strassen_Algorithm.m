
%Copyright 2020 Yi Lin(Kyle) Gao
%Licensed under the Apache License, Version 2.0 (the "License"); you may 
%not use this file except in compliance with the License. You may obtain a 
%copy of the License at http://www.apache.org/licenses/LICENSE-2.0 .

function out = Strassen_Algorithm(A,B,min_size)
%Implementation of Strassen matrix multiplication algorithm O(n^~2.8)
%https://en.wikipedia.org/wiki/Strassen_algorithm
%The algorithm has min_size=1, but in practice this is not necessary.
%In fact, because the Strassen Algorithm incurs more overhead, it becomes
%slower than naive matrx multiplication at n~512.

[m1,n1]=size(A);
[m2,n2]=size(B);
assert (m1==n1 & m2==n2,"Non-Square Matrix or Submatrix");
assert (m2==m1, "A and B have unequal size")
m = m1/2;
assert (m == round(m)|m1==1 , "Dimension non divisible by 2");
out = zeros(m1,n2);

if m1 <= min_size
    out = naiveMatMul(A,B);

else
   
    A11 = A(1:m,1:m);
    A12 = A(1:m,m+1:end);
    A21 = A(1+m:end,1:m);
    A22 = A(1+m:end,1+m:end);
    
    B11 = B(1:m,1:m);
    B12 = B(1:m,m+1:end);
    B21 = B(1+m:end,1:m);
    B22 = B(1+m:end,1+m:end);
    
    p1 = Strassen_Algorithm(A11,B12 - B22,min_size);
    p2 = Strassen_Algorithm(A11+A12, B22, min_size);
    p3 = Strassen_Algorithm(A21+A22,B11,min_size);
    p4 = Strassen_Algorithm(A22,B21-B11,min_size);
    p5 = Strassen_Algorithm(A11+A22,B11+B22,min_size);
    p6 = Strassen_Algorithm(A12-A22,B21+B22,min_size);
    p7 = Strassen_Algorithm(A11-A21,B11+B12,min_size);
    
    out(1:m,1:m)=p5+p4-p2+p6;
    out(1:m,m+1:end)=p1+p2;
    out(1+m:end,1:m)=p3+p4;
    out(1+m:end,1+m:end)=p1+p5-p3-p7;
end
end

function out = naiveMatMul(A,B)
%Implementation of the naive matrix multiplication algorithm O(n^3)
%   Uses 3 for loops
[m,p1] = size(A);
[p2,n] = size(B);

assert(p1==p2,"Matrix dimensions non matching.");

out = zeros(m,n);
    
for i = 1:m
    for j = 1:n
        sum = 0;
        for k = 1:p1
            sum = sum+ A(i,k)*B(k,j);
        out(i,j) = sum;
        end
    end
end
end
