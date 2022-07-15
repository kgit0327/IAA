function GRA = find_GRA2(L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,g1,g2,g3,m1,m2,m3,m4,m0u)
%find_GRA2
%    GRA = find_GRA2(L11,L12,L13,L21,L22,L23,L31,L32,L33,L0d1,L0d2,L0d3,Lg01,Lg02,Lg03,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,G1,G2,G3,M1,M2,M3,M4,M0U)

%    This function was generated by the Symbolic Math Toolbox version 9.0.
%    15-Jul-2022 17:46:24

mt1 = [g3.*(Lg42.*m4+m4.*(L32-Lg32)+Lg02.*(m1+m2+m3+m4+m0u)+Lg22.*(m2+m3+m4)+(L12-Lg12).*(m2+m3+m4)+L0d2.*(m1+m2+m3+m4)+Lg12.*(m1+m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22))-g2.*(Lg43.*m4+m4.*(L33-Lg33)+Lg03.*(m1+m2+m3+m4+m0u)+Lg23.*(m2+m3+m4)+(L13-Lg13).*(m2+m3+m4)+L0d3.*(m1+m2+m3+m4)+Lg13.*(m1+m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23))];
mt2 = [-g3.*(Lg41.*m4+m4.*(L31-Lg31)+Lg01.*(m1+m2+m3+m4+m0u)+Lg21.*(m2+m3+m4)+(L11-Lg11).*(m2+m3+m4)+L0d1.*(m1+m2+m3+m4)+Lg11.*(m1+m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))+g1.*(Lg43.*m4+m4.*(L33-Lg33)+Lg03.*(m1+m2+m3+m4+m0u)+Lg23.*(m2+m3+m4)+(L13-Lg13).*(m2+m3+m4)+L0d3.*(m1+m2+m3+m4)+Lg13.*(m1+m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23))];
mt3 = [g2.*(Lg41.*m4+m4.*(L31-Lg31)+Lg01.*(m1+m2+m3+m4+m0u)+Lg21.*(m2+m3+m4)+(L11-Lg11).*(m2+m3+m4)+L0d1.*(m1+m2+m3+m4)+Lg11.*(m1+m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))-g1.*(Lg42.*m4+m4.*(L32-Lg32)+Lg02.*(m1+m2+m3+m4+m0u)+Lg22.*(m2+m3+m4)+(L12-Lg12).*(m2+m3+m4)+L0d2.*(m1+m2+m3+m4)+Lg12.*(m1+m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22))];
mt4 = [g3.*(Lg42.*m4+m4.*(L32-Lg32)+Lg22.*(m2+m3+m4)+(L12-Lg12).*(m2+m3+m4)+Lg12.*(m1+m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22))-g2.*(Lg43.*m4+m4.*(L33-Lg33)+Lg23.*(m2+m3+m4)+(L13-Lg13).*(m2+m3+m4)+Lg13.*(m1+m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23))];
mt5 = [-g3.*(Lg41.*m4+m4.*(L31-Lg31)+Lg21.*(m2+m3+m4)+(L11-Lg11).*(m2+m3+m4)+Lg11.*(m1+m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))+g1.*(Lg43.*m4+m4.*(L33-Lg33)+Lg23.*(m2+m3+m4)+(L13-Lg13).*(m2+m3+m4)+Lg13.*(m1+m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23))];
mt6 = [g2.*(Lg41.*m4+m4.*(L31-Lg31)+Lg21.*(m2+m3+m4)+(L11-Lg11).*(m2+m3+m4)+Lg11.*(m1+m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))-g1.*(Lg42.*m4+m4.*(L32-Lg32)+Lg22.*(m2+m3+m4)+(L12-Lg12).*(m2+m3+m4)+Lg12.*(m1+m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22));g3.*(Lg42.*m4+m4.*(L32-Lg32)+Lg22.*(m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22))-g2.*(Lg43.*m4+m4.*(L33-Lg33)+Lg23.*(m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23))];
mt7 = [-g3.*(Lg41.*m4+m4.*(L31-Lg31)+Lg21.*(m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))+g1.*(Lg43.*m4+m4.*(L33-Lg33)+Lg23.*(m2+m3+m4)+Lg33.*(m3+m4)+(m3+m4).*(L23-Lg23));g2.*(Lg41.*m4+m4.*(L31-Lg31)+Lg21.*(m2+m3+m4)+Lg31.*(m3+m4)+(m3+m4).*(L21-Lg21))-g1.*(Lg42.*m4+m4.*(L32-Lg32)+Lg22.*(m2+m3+m4)+Lg32.*(m3+m4)+(m3+m4).*(L22-Lg22));g3.*(Lg42.*m4+m4.*(L32-Lg32)+Lg32.*(m3+m4))-g2.*(Lg43.*m4+m4.*(L33-Lg33)+Lg33.*(m3+m4))];
mt8 = [-g3.*(Lg41.*m4+m4.*(L31-Lg31)+Lg31.*(m3+m4))+g1.*(Lg43.*m4+m4.*(L33-Lg33)+Lg33.*(m3+m4));g2.*(Lg41.*m4+m4.*(L31-Lg31)+Lg31.*(m3+m4))-g1.*(Lg42.*m4+m4.*(L32-Lg32)+Lg32.*(m3+m4));Lg42.*g3.*m4-Lg43.*g2.*m4;-Lg41.*g3.*m4+Lg43.*g1.*m4;Lg41.*g2.*m4-Lg42.*g1.*m4];
GRA = [mt1;mt2;mt3;mt4;mt5;mt6;mt7;mt8];
