function GRA = find_GRA(g1,g2,g3,l0,l1,l2,l3,l4,m1,m2,m3,m4,m0u,th0_1,th0_2,th0_3,th1_1,th1_2,th1_3,th2_1,th2_2,th2_3,th3_1,th3_2,th3_3,th4_1,th4_2,th4_3)
%find_GRA
%    GRA = find_GRA(G1,G2,G3,L0,L1,L2,L3,L4,M1,M2,M3,M4,M0U,TH0_1,TH0_2,TH0_3,TH1_1,TH1_2,TH1_3,TH2_1,TH2_2,TH2_3,TH3_1,TH3_2,TH3_3,TH4_1,TH4_2,TH4_3)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    08-Jul-2022 19:36:37

et1 = g1.*(l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et2 = -g2.*(l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et3 = -g1.*(l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3));
et4 = g3.*(l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et5 = g2.*(l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3));
et6 = -g3.*(l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et7 = g2.*(l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et8 = -1.0;
et9 = g3.*(l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et10 = -g1.*(l1.*cos(th1_1).*cos(th1_2).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)+l1.*cos(th1_1).*cos(th1_2).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3));
et11 = -g3.*(l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)+l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2));
et12 = g2.*(l1.*cos(th1_1).*cos(th1_2).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)+l1.*cos(th1_1).*cos(th1_2).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3));
et13 = l0.*(cos(th0_3).*sin(th0_1)+cos(th0_1).*sin(th0_2).*sin(th0_3)).*(m1+m2+m3+m4).*(-1.43e+2./2.5e+2)+l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)-l0.*(cos(th0_3).*sin(th0_1)+cos(th0_1).*sin(th0_2).*sin(th0_3)).*(m1+m2+m3+m4+m0u).*(1.07e+2./2.5e+2);
et14 = l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2);
et15 = l0.*(sin(th0_1).*sin(th0_3)-cos(th0_1).*cos(th0_3).*sin(th0_2)).*(m1+m2+m3+m4).*(-1.43e+2./2.5e+2)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3);
et16 = l0.*(sin(th0_1).*sin(th0_3)-cos(th0_1).*cos(th0_3).*sin(th0_2)).*(m1+m2+m3+m4+m0u).*(-1.07e+2./2.5e+2)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2);
et17 = l0.*(sin(th0_1).*sin(th0_3)-cos(th0_1).*cos(th0_3).*sin(th0_2)).*(m1+m2+m3+m4).*(-1.43e+2./2.5e+2)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3);
et18 = l0.*(sin(th0_1).*sin(th0_3)-cos(th0_1).*cos(th0_3).*sin(th0_2)).*(m1+m2+m3+m4+m0u).*(-1.07e+2./2.5e+2)+l1.*(sin(th1_1).*sin(th1_3)-cos(th1_1).*cos(th1_3).*sin(th1_2)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(sin(th2_1).*sin(th2_3)-cos(th2_1).*cos(th2_3).*sin(th2_2)).*(m2+m3+m4).*(8.3e+1./2.0e+2);
et19 = l0.*(cos(th0_3).*sin(th0_1)+cos(th0_1).*sin(th0_2).*sin(th0_3)).*(m1+m2+m3+m4).*(-1.43e+2./2.5e+2)+l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)-l0.*(cos(th0_3).*sin(th0_1)+cos(th0_1).*sin(th0_2).*sin(th0_3)).*(m1+m2+m3+m4+m0u).*(1.07e+2./2.5e+2);
et20 = l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2);
mt1 = [g2.*(l1.*cos(th1_1).*cos(th1_2).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)-l0.*cos(th0_1).*cos(th0_2).*(m1+m2+m3+m4).*(1.43e+2./2.5e+2)+l1.*cos(th1_1).*cos(th1_2).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3)-l0.*cos(th0_1).*cos(th0_2).*(m1+m2+m3+m4+m0u).*(1.07e+2./2.5e+2))-g3.*(et19+et20)];
mt2 = [-g1.*(l1.*cos(th1_1).*cos(th1_2).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m2+m3+m4).*(8.3e+1./2.0e+2)-l0.*cos(th0_1).*cos(th0_2).*(m1+m2+m3+m4).*(1.43e+2./2.5e+2)+l1.*cos(th1_1).*cos(th1_2).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*cos(th2_1).*cos(th2_2).*(m3+m4).*(1.17e+2./2.0e+2)+l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3)-l0.*cos(th0_1).*cos(th0_2).*(m1+m2+m3+m4+m0u).*(1.07e+2./2.5e+2))+g3.*(et17+et18);g1.*(et13+et14)-g2.*(et15+et16);et11+et12;et9+et10];
mt3 = [g1.*(l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m1+m2+m3+m4).*(5.29e+2./1.0e+3)+l2.*(m3+m4).*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(1.17e+2./2.0e+2)+l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)+l1.*(cos(th1_3).*sin(th1_1)+cos(th1_1).*sin(th1_2).*sin(th1_3)).*(m2+m3+m4).*(4.71e+2./1.0e+3)+l2.*(cos(th2_3).*sin(th2_1)+cos(th2_1).*sin(th2_2).*sin(th2_3)).*(m2+m3+m4).*(8.3e+1./2.0e+2))+et7.*et8;et5+et6;et3+et4;et1+et2];
mt4 = [-g3.*(l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3))+g2.*(l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3))];
mt5 = [g3.*(l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3))-g1.*(l3.*cos(th3_1).*cos(th3_2).*(m3+m4).*(8.91e+2./1.0e+3)+l3.*m4.*cos(th3_1).*cos(th3_2).*(1.09e+2./1.0e+3)+l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3))];
mt6 = [g1.*(l3.*(m3+m4).*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(8.91e+2./1.0e+3)+l3.*m4.*(cos(th3_3).*sin(th3_1)+cos(th3_1).*sin(th3_2).*sin(th3_3)).*(1.09e+2./1.0e+3)+l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3))-g2.*(l3.*(m3+m4).*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(8.91e+2./1.0e+3)+l3.*m4.*(sin(th3_1).*sin(th3_3)-cos(th3_1).*cos(th3_3).*sin(th3_2)).*(1.09e+2./1.0e+3)+l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3))];
mt7 = [g3.*l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(-5.19e+2./1.0e+3)+g2.*l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3);g3.*l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)-g1.*l4.*m4.*cos(th4_1).*cos(th4_2).*(5.19e+2./1.0e+3);g1.*l4.*m4.*(cos(th4_3).*sin(th4_1)+cos(th4_1).*sin(th4_2).*sin(th4_3)).*(5.19e+2./1.0e+3)-g2.*l4.*m4.*(sin(th4_1).*sin(th4_3)-cos(th4_1).*cos(th4_3).*sin(th4_2)).*(5.19e+2./1.0e+3)];
GRA = [mt1;mt2;mt3;mt4;mt5;mt6;mt7];
