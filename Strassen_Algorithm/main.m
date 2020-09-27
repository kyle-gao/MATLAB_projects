A=rand(16,16);
B=rand(16,16);
%We need to augment input matrices to nearest power of 2 for Strassen
%Algorithm.
roundn = @(x,n) round(x*10^n)./10^n; 
C1=roundn(Strassen_Algorithm(A,B,2),10);
C2=roundn(A*B,10);
%The 2 different algorithms produce different rounding errors of order
%10^-13. So we round to 10^-10 before comparison.
isequal(C1,C2)
