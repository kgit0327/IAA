function INT_B2 = find_INT_B2(B21,B22,B23,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m3,m4)
%find_INT_B2
%    INT_B2 = find_INT_B2(B21,B22,B23,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,M3,M4)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    10-Aug-2022 19:07:47

mt1 = [-B21.*(m3+m4);-B22.*(m3+m4);-B23.*(m3+m4);-B23.*(L02.*m3+L02.*m4+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4)+B22.*(L03.*m3+L03.*m4+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4);B23.*(L01.*m3+L01.*m4+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)-B21.*(L03.*m3+L03.*m4+L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4)];
mt2 = [-B22.*(L01.*m3+L01.*m4+L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)+B21.*(L02.*m3+L02.*m4+L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4);-B23.*(L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4)+B22.*(L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4);B23.*(L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)-B21.*(L13.*m3+L13.*m4+L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4)];
mt3 = [-B22.*(L11.*m3+L11.*m4+L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)+B21.*(L12.*m3+L12.*m4+L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4);-B23.*(L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4)+B22.*(L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4);B23.*(L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)-B21.*(L23.*m3+L23.*m4+L33.*m4+Lg33.*m3+Lg43.*m4);-B22.*(L21.*m3+L21.*m4+L31.*m4+Lg31.*m3+Lg41.*m4)+B21.*(L22.*m3+L22.*m4+L32.*m4+Lg32.*m3+Lg42.*m4);-B23.*(L32.*m4+Lg32.*m3+Lg42.*m4)+B22.*(L33.*m4+Lg33.*m3+Lg43.*m4)];
mt4 = [B23.*(L31.*m4+Lg31.*m3+Lg41.*m4)-B21.*(L33.*m4+Lg33.*m3+Lg43.*m4);-B22.*(L31.*m4+Lg31.*m3+Lg41.*m4)+B21.*(L32.*m4+Lg32.*m3+Lg42.*m4);B22.*Lg43.*m4-B23.*Lg42.*m4;-B21.*Lg43.*m4+B23.*Lg41.*m4;B21.*Lg42.*m4-B22.*Lg41.*m4];
INT_B2 = [mt1;mt2;mt3;mt4];