function INT_A3 = find_INT_A3(A31,A32,A33,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,m3,m4)
%find_INT_A3
%    INT_A3 = find_INT_A3(A31,A32,A33,I_gcs31_1,I_gcs31_2,I_gcs31_3,I_gcs32_1,I_gcs32_2,I_gcs32_3,I_gcs33_1,I_gcs33_2,I_gcs33_3,I_gcs41_1,I_gcs41_2,I_gcs41_3,I_gcs42_1,I_gcs42_2,I_gcs42_3,I_gcs43_1,I_gcs43_2,I_gcs43_3,L01,L02,L03,L11,L12,L13,L21,L22,L23,L31,L32,L33,Lg31,Lg32,Lg33,Lg41,Lg42,Lg43,M3,M4)

%    This function was generated by the Symbolic Math Toolbox version 9.1.
%    10-Aug-2022 19:07:45

et1 = A31.*(-I_gcs33_1-I_gcs43_1+L11.*L33.*m4+L21.*L33.*m4+L31.*L33.*m4+L11.*Lg33.*m3+L21.*Lg33.*m3+L11.*Lg43.*m4+L21.*Lg43.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4)+A32.*(-I_gcs33_2-I_gcs43_2+L12.*L33.*m4+L22.*L33.*m4+L32.*L33.*m4+L12.*Lg33.*m3+L22.*Lg33.*m3+L12.*Lg43.*m4+L22.*Lg43.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4);
et2 = -A33.*(I_gcs33_3+I_gcs43_3+L31.^2.*m4+L32.^2.*m4+Lg31.^2.*m3+Lg32.^2.*m3+Lg41.^2.*m4+Lg42.^2.*m4+L11.*L31.*m4+L12.*L32.*m4+L21.*L31.*m4+L22.*L32.*m4+L11.*Lg31.*m3+L12.*Lg32.*m3+L21.*Lg31.*m3+L11.*Lg41.*m4+L22.*Lg32.*m3+L12.*Lg42.*m4+L21.*Lg41.*m4+L22.*Lg42.*m4+L31.*Lg41.*m4.*2.0+L32.*Lg42.*m4.*2.0);
et3 = A31.*(-I_gcs32_1-I_gcs42_1+L11.*L32.*m4+L21.*L32.*m4+L31.*L32.*m4+L11.*Lg32.*m3+L21.*Lg32.*m3+L11.*Lg42.*m4+L21.*Lg42.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs32_3-I_gcs42_3+L13.*L32.*m4+L23.*L32.*m4+L32.*L33.*m4+L13.*Lg32.*m3+L23.*Lg32.*m3+L13.*Lg42.*m4+L23.*Lg42.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4);
et4 = -A32.*(I_gcs32_2+I_gcs42_2+L31.^2.*m4+L33.^2.*m4+Lg31.^2.*m3+Lg33.^2.*m3+Lg41.^2.*m4+Lg43.^2.*m4+L11.*L31.*m4+L13.*L33.*m4+L21.*L31.*m4+L23.*L33.*m4+L11.*Lg31.*m3+L13.*Lg33.*m3+L21.*Lg31.*m3+L11.*Lg41.*m4+L23.*Lg33.*m3+L13.*Lg43.*m4+L21.*Lg41.*m4+L23.*Lg43.*m4+L31.*Lg41.*m4.*2.0+L33.*Lg43.*m4.*2.0);
et5 = A32.*(-I_gcs31_2-I_gcs41_2+L12.*L31.*m4+L22.*L31.*m4+L31.*L32.*m4+L12.*Lg31.*m3+L22.*Lg31.*m3+L12.*Lg41.*m4+L22.*Lg41.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs31_3-I_gcs41_3+L13.*L31.*m4+L23.*L31.*m4+L31.*L33.*m4+L13.*Lg31.*m3+L23.*Lg31.*m3+L13.*Lg41.*m4+L23.*Lg41.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4);
et6 = -A31.*(I_gcs31_1+I_gcs41_1+L32.^2.*m4+L33.^2.*m4+Lg32.^2.*m3+Lg33.^2.*m3+Lg42.^2.*m4+Lg43.^2.*m4+L12.*L32.*m4+L13.*L33.*m4+L22.*L32.*m4+L23.*L33.*m4+L12.*Lg32.*m3+L13.*Lg33.*m3+L22.*Lg32.*m3+L12.*Lg42.*m4+L23.*Lg33.*m3+L13.*Lg43.*m4+L22.*Lg42.*m4+L23.*Lg43.*m4+L32.*Lg42.*m4.*2.0+L33.*Lg43.*m4.*2.0);
et7 = -A33.*(I_gcs33_3+I_gcs43_3+L31.^2.*m4+L32.^2.*m4+Lg31.^2.*m3+Lg32.^2.*m3+Lg41.^2.*m4+Lg42.^2.*m4+L01.*L31.*m4+L02.*L32.*m4+L11.*L31.*m4+L12.*L32.*m4+L21.*L31.*m4+L22.*L32.*m4+L01.*Lg31.*m3+L02.*Lg32.*m3+L11.*Lg31.*m3+L01.*Lg41.*m4+L12.*Lg32.*m3+L02.*Lg42.*m4+L21.*Lg31.*m3+L11.*Lg41.*m4+L22.*Lg32.*m3+L12.*Lg42.*m4+L21.*Lg41.*m4+L22.*Lg42.*m4+L31.*Lg41.*m4.*2.0+L32.*Lg42.*m4.*2.0)+A31.*(-I_gcs33_1-I_gcs43_1+L01.*L33.*m4+L11.*L33.*m4+L21.*L33.*m4+L31.*L33.*m4+L01.*Lg33.*m3+L11.*Lg33.*m3+L01.*Lg43.*m4+L21.*Lg33.*m3+L11.*Lg43.*m4+L21.*Lg43.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4);
et8 = A32.*(-I_gcs33_2-I_gcs43_2+L02.*L33.*m4+L12.*L33.*m4+L22.*L33.*m4+L32.*L33.*m4+L02.*Lg33.*m3+L12.*Lg33.*m3+L02.*Lg43.*m4+L22.*Lg33.*m3+L12.*Lg43.*m4+L22.*Lg43.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4);
et9 = -A32.*(I_gcs32_2+I_gcs42_2+L31.^2.*m4+L33.^2.*m4+Lg31.^2.*m3+Lg33.^2.*m3+Lg41.^2.*m4+Lg43.^2.*m4+L01.*L31.*m4+L03.*L33.*m4+L11.*L31.*m4+L13.*L33.*m4+L21.*L31.*m4+L23.*L33.*m4+L01.*Lg31.*m3+L03.*Lg33.*m3+L11.*Lg31.*m3+L01.*Lg41.*m4+L13.*Lg33.*m3+L03.*Lg43.*m4+L21.*Lg31.*m3+L11.*Lg41.*m4+L23.*Lg33.*m3+L13.*Lg43.*m4+L21.*Lg41.*m4+L23.*Lg43.*m4+L31.*Lg41.*m4.*2.0+L33.*Lg43.*m4.*2.0)+A31.*(-I_gcs32_1-I_gcs42_1+L01.*L32.*m4+L11.*L32.*m4+L21.*L32.*m4+L31.*L32.*m4+L01.*Lg32.*m3+L11.*Lg32.*m3+L01.*Lg42.*m4+L21.*Lg32.*m3+L11.*Lg42.*m4+L21.*Lg42.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4);
et10 = A33.*(-I_gcs32_3-I_gcs42_3+L03.*L32.*m4+L13.*L32.*m4+L23.*L32.*m4+L32.*L33.*m4+L03.*Lg32.*m3+L13.*Lg32.*m3+L03.*Lg42.*m4+L23.*Lg32.*m3+L13.*Lg42.*m4+L23.*Lg42.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4);
et11 = -A31.*(I_gcs31_1+I_gcs41_1+L32.^2.*m4+L33.^2.*m4+Lg32.^2.*m3+Lg33.^2.*m3+Lg42.^2.*m4+Lg43.^2.*m4+L02.*L32.*m4+L03.*L33.*m4+L12.*L32.*m4+L13.*L33.*m4+L22.*L32.*m4+L23.*L33.*m4+L02.*Lg32.*m3+L03.*Lg33.*m3+L12.*Lg32.*m3+L02.*Lg42.*m4+L13.*Lg33.*m3+L03.*Lg43.*m4+L22.*Lg32.*m3+L12.*Lg42.*m4+L23.*Lg33.*m3+L13.*Lg43.*m4+L22.*Lg42.*m4+L23.*Lg43.*m4+L32.*Lg42.*m4.*2.0+L33.*Lg43.*m4.*2.0)+A32.*(-I_gcs31_2-I_gcs41_2+L02.*L31.*m4+L12.*L31.*m4+L22.*L31.*m4+L31.*L32.*m4+L02.*Lg31.*m3+L12.*Lg31.*m3+L02.*Lg41.*m4+L22.*Lg31.*m3+L12.*Lg41.*m4+L22.*Lg41.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4);
et12 = A33.*(-I_gcs31_3-I_gcs41_3+L03.*L31.*m4+L13.*L31.*m4+L23.*L31.*m4+L31.*L33.*m4+L03.*Lg31.*m3+L13.*Lg31.*m3+L03.*Lg41.*m4+L23.*Lg31.*m3+L13.*Lg41.*m4+L23.*Lg41.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4);
mt1 = [A33.*(L32.*m4+Lg32.*m3+Lg42.*m4)-A32.*(L33.*m4+Lg33.*m3+Lg43.*m4);-A33.*(L31.*m4+Lg31.*m3+Lg41.*m4)+A31.*(L33.*m4+Lg33.*m3+Lg43.*m4);A32.*(L31.*m4+Lg31.*m3+Lg41.*m4)-A31.*(L32.*m4+Lg32.*m3+Lg42.*m4);et11+et12;et9+et10;et7+et8;et5+et6;et3+et4;et1+et2];
mt2 = [A32.*(-I_gcs31_2-I_gcs41_2+L22.*L31.*m4+L31.*L32.*m4+L22.*Lg31.*m3+L22.*Lg41.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs31_3-I_gcs41_3+L23.*L31.*m4+L31.*L33.*m4+L23.*Lg31.*m3+L23.*Lg41.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4)-A31.*(I_gcs31_1+I_gcs41_1+L32.^2.*m4+L33.^2.*m4+Lg32.^2.*m3+Lg33.^2.*m3+Lg42.^2.*m4+Lg43.^2.*m4+L22.*L32.*m4+L23.*L33.*m4+L22.*Lg32.*m3+L23.*Lg33.*m3+L22.*Lg42.*m4+L23.*Lg43.*m4+L32.*Lg42.*m4.*2.0+L33.*Lg43.*m4.*2.0)];
mt3 = [A31.*(-I_gcs32_1-I_gcs42_1+L21.*L32.*m4+L31.*L32.*m4+L21.*Lg32.*m3+L21.*Lg42.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs32_3-I_gcs42_3+L23.*L32.*m4+L32.*L33.*m4+L23.*Lg32.*m3+L23.*Lg42.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4)-A32.*(I_gcs32_2+I_gcs42_2+L31.^2.*m4+L33.^2.*m4+Lg31.^2.*m3+Lg33.^2.*m3+Lg41.^2.*m4+Lg43.^2.*m4+L21.*L31.*m4+L23.*L33.*m4+L21.*Lg31.*m3+L23.*Lg33.*m3+L21.*Lg41.*m4+L23.*Lg43.*m4+L31.*Lg41.*m4.*2.0+L33.*Lg43.*m4.*2.0)];
mt4 = [A31.*(-I_gcs33_1-I_gcs43_1+L21.*L33.*m4+L31.*L33.*m4+L21.*Lg33.*m3+L21.*Lg43.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4)+A32.*(-I_gcs33_2-I_gcs43_2+L22.*L33.*m4+L32.*L33.*m4+L22.*Lg33.*m3+L22.*Lg43.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4)-A33.*(I_gcs33_3+I_gcs43_3+L31.^2.*m4+L32.^2.*m4+Lg31.^2.*m3+Lg32.^2.*m3+Lg41.^2.*m4+Lg42.^2.*m4+L21.*L31.*m4+L22.*L32.*m4+L21.*Lg31.*m3+L22.*Lg32.*m3+L21.*Lg41.*m4+L22.*Lg42.*m4+L31.*Lg41.*m4.*2.0+L32.*Lg42.*m4.*2.0)];
mt5 = [-A31.*(I_gcs31_1+I_gcs41_1+L32.^2.*m4+L33.^2.*m4+Lg32.^2.*m3+Lg33.^2.*m3+Lg42.^2.*m4+Lg43.^2.*m4+L32.*Lg42.*m4.*2.0+L33.*Lg43.*m4.*2.0)+A32.*(-I_gcs31_2-I_gcs41_2+L31.*L32.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs31_3-I_gcs41_3+L31.*L33.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4)];
mt6 = [-A32.*(I_gcs32_2+I_gcs42_2+L31.^2.*m4+L33.^2.*m4+Lg31.^2.*m3+Lg33.^2.*m3+Lg41.^2.*m4+Lg43.^2.*m4+L31.*Lg41.*m4.*2.0+L33.*Lg43.*m4.*2.0)+A31.*(-I_gcs32_1-I_gcs42_1+L31.*L32.*m4+L31.*Lg42.*m4+L32.*Lg41.*m4+Lg31.*Lg32.*m3+Lg41.*Lg42.*m4)+A33.*(-I_gcs32_3-I_gcs42_3+L32.*L33.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4)];
mt7 = [-A33.*(I_gcs33_3+I_gcs43_3+L31.^2.*m4+L32.^2.*m4+Lg31.^2.*m3+Lg32.^2.*m3+Lg41.^2.*m4+Lg42.^2.*m4+L31.*Lg41.*m4.*2.0+L32.*Lg42.*m4.*2.0)+A31.*(-I_gcs33_1-I_gcs43_1+L31.*L33.*m4+L31.*Lg43.*m4+L33.*Lg41.*m4+Lg31.*Lg33.*m3+Lg41.*Lg43.*m4)+A32.*(-I_gcs33_2-I_gcs43_2+L32.*L33.*m4+L32.*Lg43.*m4+L33.*Lg42.*m4+Lg32.*Lg33.*m3+Lg42.*Lg43.*m4);-A31.*(I_gcs41_1+Lg42.^2.*m4+Lg43.^2.*m4+L32.*Lg42.*m4+L33.*Lg43.*m4)+A32.*(-I_gcs41_2+L31.*Lg42.*m4+Lg41.*Lg42.*m4)+A33.*(-I_gcs41_3+L31.*Lg43.*m4+Lg41.*Lg43.*m4)];
mt8 = [-A32.*(I_gcs42_2+Lg41.^2.*m4+Lg43.^2.*m4+L31.*Lg41.*m4+L33.*Lg43.*m4)+A31.*(-I_gcs42_1+L32.*Lg41.*m4+Lg41.*Lg42.*m4)+A33.*(-I_gcs42_3+L32.*Lg43.*m4+Lg42.*Lg43.*m4);-A33.*(I_gcs43_3+Lg41.^2.*m4+Lg42.^2.*m4+L31.*Lg41.*m4+L32.*Lg42.*m4)+A31.*(-I_gcs43_1+L33.*Lg41.*m4+Lg41.*Lg43.*m4)+A32.*(-I_gcs43_2+L33.*Lg42.*m4+Lg42.*Lg43.*m4)];
INT_A3 = [mt1;mt2;mt3;mt4;mt5;mt6;mt7;mt8];
