C1 = ;
C2 = ;
C3 = ;
C4 = ;
c1 = 1.1910427 * (10^(-5));
c2 = 1.4387752;
Nu = 2670;
A = 1.67396;
B = 0.997364;
d0 = 276.6067;
d1 = 0.051111;
d2 = 1.405783 * (10^(-6));
d3 = 0;
d4 = 0;

T1p = d0 + d1 * C1 + d2*(C1^2) + d3*(C1^3) + d4*(C1^4);
T2p = d0 + d1 * C2 + d2*(C2^2) + d3*(C2^3) + d4*(C2^4);
T3p = d0 + d1 * C3 + d2*(C3^2) + d3*(C3^3) + d4*(C3^4);
T4p = d0 + d1 * C4 + d2*(C4^2) + d3*(C4^3) + d4*(C4^4);

Tbb = (T1p + T2p + T3p + T4p) / 4;

Tbb1 = A + B * Tbb;
Nbb = (c1 * Nu^3) / (exp(c2 * Nu / Tbb1) - 1);

Nlin = Ns + (Nbb - Ns) * (Cs -  Ce) / (Cs - Cbb);
Ncor = b0 + b1*Nlin + b2*Nlin*Nlin
Ne = Nlin + Ncor

Te_ = c2 * Nu / log(1 + (c1 * Nu**3) / Ne)
Te = (Te_ - A) / B