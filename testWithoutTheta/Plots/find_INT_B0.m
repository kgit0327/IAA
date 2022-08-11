function INT_B0 = find_INT_B0(B01,B02,B03,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m1,m2,m3,m4)
%find_INT_B0
%    INT_B0 = find_INT_B0(B01,B02,B03,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg11,Lg12,Lg13,Lg21,Lg22,Lg23,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,M1,M2,M3,M4)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    10-Aug-2022 19:07:47

mt1 = [-B01.*(m1+m2+m3+m4);-B02.*(m1+m2+m3+m4);-B03.*(m1+m2+m3+m4);-B03.*(L02.*m1+L02.*m2+L02.*m3+L02.*m4+L12.*m2+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg12.*m1+Lg22.*m2+Lg32.*m3+Lg42.*m4)+B02.*(L03.*m1+L03.*m2+L03.*m3+L03.*m4+L13.*m2+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg13.*m1+Lg23.*m2+Lg33.*m3+Lg43.*m4)];
mt2 = [B03.*(L01.*m1+L01.*m2+L01.*m3+L01.*m4+L11.*m2+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg11.*m1+Lg21.*m2+Lg31.*m3+Lg41.*m4)-B01.*(L03.*m1+L03.*m2+L03.*m3+L03.*m4+L13.*m2+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg13.*m1+Lg23.*m2+Lg33.*m3+Lg43.*m4);-B02.*(L01.*m1+L01.*m2+L01.*m3+L01.*m4+L11.*m2+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg11.*m1+Lg21.*m2+Lg31.*m3+Lg41.*m4)+B01.*(L02.*m1+L02.*m2+L02.*m3+L02.*m4+L12.*m2+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg12.*m1+Lg22.*m2+Lg32.*m3+Lg42.*m4)];
mt3 = [-B03.*(L12.*m2+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg12.*m1+Lg22.*m2+Lg32.*m3+Lg42.*m4)+B02.*(L13.*m2+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg13.*m1+Lg23.*m2+Lg33.*m3+Lg43.*m4);B03.*(L11.*m2+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg11.*m1+Lg21.*m2+Lg31.*m3+Lg41.*m4)-B01.*(L13.*m2+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg13.*m1+Lg23.*m2+Lg33.*m3+Lg43.*m4)];
mt4 = [-B02.*(L11.*m2+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg11.*m1+Lg21.*m2+Lg31.*m3+Lg41.*m4)+B01.*(L12.*m2+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg12.*m1+Lg22.*m2+Lg32.*m3+Lg42.*m4);-B03.*(L22.*m3+L22.*m4+L32.*m4+Lg22.*m2+Lg32.*m3+Lg42.*m4)+B02.*(L23.*m3+L23.*m4+L33.*m4+Lg23.*m2+Lg33.*m3+Lg43.*m4);B03.*(L21.*m3+L21.*m4+L31.*m4+Lg21.*m2+Lg31.*m3+Lg41.*m4)-B01.*(L23.*m3+L23.*m4+L33.*m4+Lg23.*m2+Lg33.*m3+Lg43.*m4)];
mt5 = [-B02.*(L21.*m3+L21.*m4+L31.*m4+Lg21.*m2+Lg31.*m3+Lg41.*m4)+B01.*(L22.*m3+L22.*m4+L32.*m4+Lg22.*m2+Lg32.*m3+Lg42.*m4);-B03.*(L32.*m4+Lg32.*m3+Lg42.*m4)+B02.*(L33.*m4+Lg33.*m3+Lg43.*m4);B03.*(L31.*m4+Lg31.*m3+Lg41.*m4)-B01.*(L33.*m4+Lg33.*m3+Lg43.*m4);-B02.*(L31.*m4+Lg31.*m3+Lg41.*m4)+B01.*(L32.*m4+Lg32.*m3+Lg42.*m4);B02.*Lg43.*m4-B03.*Lg42.*m4;-B01.*Lg43.*m4+B03.*Lg41.*m4;B01.*Lg42.*m4-B02.*Lg41.*m4];
INT_B0 = [mt1;mt2;mt3;mt4;mt5];