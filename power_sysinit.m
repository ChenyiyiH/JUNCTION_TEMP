clc;
clear all;
run("Device_Parameter.m");
%以下部分为整流时，系统参数值，均可调节
% f_switch = 500;
% IN = 0.3; %正是回馈，负是整流正常工作状态.：1,10MVA;0.8,8MVA
% f = 50; %基波频率
% m = 1;%调制比
%以下部分为逆变时，系统参数值，先确定基波频率
f = 40;
m = 1/75*f;
f_switch = f*12.5;
if f_switch>=900
    f_switch = 900;
end
IN =  0.3;%正是逆变正常工作状态，负是回馈.：1,10MVA;0.8,8MVA
if m >= 0.4
    PM = 1;    % 0 module1,1=module2 调制度低用1 调制度高用2
else
    PM = 0;
end
Udc = 2500;
R_absorption = 0.45;
if abs(IN) >= 1.2
    L_absorption = 3e-6;
else
    L_absorption = 4e-6;
end
C_absorption = 34e-6;
Td = 15e-7;%直通抑制
temp_init = 40;
%系统采样时间
TC = 1/f_switch;
Ts = 2e-6; 
Ts2 = 500E-6;
Ts1 = 1e-6;
%%
GCT = IGCT_654522_6;
DIODE = DIODE_344520;
VT0_DIODE = DIODE.VF0;
Err_DIODE = DIODE.Err;
IFQ_DIODE = DIODE.IFQ;
Vdc_DIODE = DIODE.Vdc;
rF_DIODE = DIODE.rF;

rT_GCT = GCT.rT;
VT0_GCT = GCT.VT0; 
Eon_GCT = GCT.Eon;
IT_GCT = GCT.IT;
Vdc_GCT = GCT.Vdc;
% sim("power_10MW5_diode.slx");
% ans = [pl_T1(end),max(tem_T1),pl_T2(end),max(tem_T2),pl_D1(end),max(tem_D1),...
%     pl_D2(end),max(tem_D2),pl_D5(end),max(tem_D5),i_45(end),i_15(end),pl_D7(end),max(tem_D7)]
% ans = [pl_D1(end),max(tem_D1),pl_D2(end),max(tem_D2),pl_D5(end),max(tem_D5)]