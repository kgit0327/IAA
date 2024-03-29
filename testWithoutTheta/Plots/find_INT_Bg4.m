function INT_Bg4 = find_INT_Bg4(Bg41,Bg42,Bg43,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg41,Lg42,Lg43,m4)
%find_INT_Bg4
%    INT_Bg4 = find_INT_Bg4(Bg41,Bg42,Bg43,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg41,Lg42,Lg43,M4)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    10-Aug-2022 19:08:10

mt1 = [-Bg41.*m4;-Bg42.*m4;-Bg43.*m4;-Bg43.*(L02.*m4+L12.*m4+L22.*m4+L32.*m4+Lg42.*m4)+Bg42.*(L03.*m4+L13.*m4+L23.*m4+L33.*m4+Lg43.*m4);Bg43.*(L01.*m4+L11.*m4+L21.*m4+L31.*m4+Lg41.*m4)-Bg41.*(L03.*m4+L13.*m4+L23.*m4+L33.*m4+Lg43.*m4);-Bg42.*(L01.*m4+L11.*m4+L21.*m4+L31.*m4+Lg41.*m4)+Bg41.*(L02.*m4+L12.*m4+L22.*m4+L32.*m4+Lg42.*m4);-Bg43.*(L12.*m4+L22.*m4+L32.*m4+Lg42.*m4)+Bg42.*(L13.*m4+L23.*m4+L33.*m4+Lg43.*m4);Bg43.*(L11.*m4+L21.*m4+L31.*m4+Lg41.*m4)-Bg41.*(L13.*m4+L23.*m4+L33.*m4+Lg43.*m4)];
mt2 = [-Bg42.*(L11.*m4+L21.*m4+L31.*m4+Lg41.*m4)+Bg41.*(L12.*m4+L22.*m4+L32.*m4+Lg42.*m4);-Bg43.*(L22.*m4+L32.*m4+Lg42.*m4)+Bg42.*(L23.*m4+L33.*m4+Lg43.*m4);Bg43.*(L21.*m4+L31.*m4+Lg41.*m4)-Bg41.*(L23.*m4+L33.*m4+Lg43.*m4);-Bg42.*(L21.*m4+L31.*m4+Lg41.*m4)+Bg41.*(L22.*m4+L32.*m4+Lg42.*m4);-Bg43.*(L32.*m4+Lg42.*m4)+Bg42.*(L33.*m4+Lg43.*m4);Bg43.*(L31.*m4+Lg41.*m4)-Bg41.*(L33.*m4+Lg43.*m4);-Bg42.*(L31.*m4+Lg41.*m4)+Bg41.*(L32.*m4+Lg42.*m4);Bg42.*Lg43.*m4-Bg43.*Lg42.*m4;-Bg41.*Lg43.*m4+Bg43.*Lg41.*m4];
mt3 = [Bg41.*Lg42.*m4-Bg42.*Lg41.*m4];
INT_Bg4 = [mt1;mt2;mt3];
