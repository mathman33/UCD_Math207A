clear all
clc
close all

%demo=1;%demonstrates a chaotic gait
%demo=2;%uncomment this to see a period 4 gait
% demo_num=3;%uncomment this to see a period 1 gait
demo_num=5;


if demo_num==1
    %demonstrate a chaotic gait
    Z_Chaos=[0.24420426 -0.23627176];%initial condition, Z=[theta_0, dtheta_0]
    g_Chaos=0.015;%slope (gamma)
    animate=0;%don't animate the results
    poincare=1;%show the poincare section
    rootfind=0;%no rootfind.
    per=1;%this parameter only matters for the rootfind

    [t,Z,X]=SimpleWalker(Z_Chaos,animate,poincare,rootfind,per,g_Chaos,demo_num);
elseif demo_num==2
    %demonstrate a period 4 gait
    Z_Per4=[0.24347253 -0.23610179];
    g_Per4=0.0145;
    animate=1;%animate the results
    poincare=0;%don't show the poincare section
    rootfind=1;%do a rootfind.
    per=4;%look for period 4 solutions
    
    [t,Z,X]=SimpleWalker(Z_Per4,animate,poincare,rootfind,per,g_Per4,demo_num);
elseif demo_num==3
    %demonstrate a period 1 gait
    
    Z_Per1=[0.22065150 -0.21697945];
    g_Per1=0.012;
    animate=1;%animate the results
    poincare=0;%don't show the poincare section
    rootfind=0;%don't do a rootfind.
    per=1;%this parameter only matters for the rootfind
    
    [t,Z,X]=SimpleWalker(Z_Per1,animate,poincare,rootfind,per,g_Per1,demo_num);
elseif demo_num==4

    Z_Per1=[0.22065150 -0.21697945];
    for g=0.0001:0.0001:0.02
        fprintf('gamma = %0.4f\n', g);
        animate=0;%animate the results
        poincare=0;%don't show the poincare section
        rootfind=0;%don't do a rootfind.
        per=1;%this parameter only matters for the rootfind
        
        [t,Z,X]=SimpleWalker(Z_Per1,animate,poincare,rootfind,per,g,demo_num);
    end
elseif demo_num==5
    animate=1;%animate the results
    poincare=0;%don't show the poincare section
    rootfind=0;%don't do a rootfind.
    per=1;%this parameter only matters for the rootfind

    IC=[2.80944293 0.00243387];
    g=0.0001;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.21922983 -0.28040255];
    g=0.0002;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.21214082 -0.77003468];
    g=0.0003;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.21247587 -0.26255226];
    g=0.0004;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.23190991 -0.35645511];
    g=0.0005;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[3.21707778 -0.28954493];
    g=0.0006;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.17624767 0.00032455];
    g=0.0007;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.78681410 -0.00194573];
    g=0.0008;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.76629648 -0.00211838];
    g=0.0009;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.80931378 -0.00401634];
    g=0.0010;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.15930599 0.00058785];
    g=0.0011;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.23114890 -0.37692220];
    g=0.0012;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.22863175 -0.36671006];
    g=0.0013;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.21344252 -0.30778432];
    g=0.0014;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.70085120 -0.00348754];
    g=0.0015;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.65315171 0.01689009];
    g=0.0016;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.65157138 0.01761018];
    g=0.0017;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.65003181 0.01832120];
    g=0.0018;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64852922 0.01902410];
    g=0.0019;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.64706061 0.01971962];
    g=0.0020;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64562337 0.02040835];
    g=0.0021;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64421521 0.02109085];
    g=0.0022;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64283407 0.02176760];
    g=0.0023;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64147814 0.02243904];
    g=0.0024;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.64014586 0.02310551];
    g=0.0025;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.63883584 0.02376731];
    g=0.0026;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63754677 0.02442476];
    g=0.0027;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63627745 0.02507814];
    g=0.0028;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63502679 0.02572769];
    g=0.0029;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.63379380 0.02637366];
    g=0.0030;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63257755 0.02701625];
    g=0.0031;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63137721 0.02765566];
    g=0.0032;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.63019201 0.02829208];
    g=0.0033;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.62902123 0.02892566];
    g=0.0034;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.62786422 0.02955657];
    g=0.0035;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.62672035 0.03018494];
    g=0.0036;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.62558906 0.03081090];
    g=0.0037;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.62446982 0.03143459];
    g=0.0038;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.62336216 0.03205608];
    g=0.0039;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.47066554 -0.00267689];
    g=0.0040;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.63889950 -0.00859906];
    g=0.0041;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.60891767 -0.00737540];
    g=0.0042;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.08882606 -0.98790073];
    g=0.0043;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.61798139 0.03513486];
    g=0.0044;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.61693391 0.03574557];
    g=0.0045;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.61589537 0.03635468];
    g=0.0046;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.60452125 -0.01304165];
    g=0.0047;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.05537305 -0.67977823];
    g=0.0048;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.07445031 -1.00131061];
    g=0.0049;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[-5.67136188 0.03877723];
    g=0.0050;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.16646230 -0.16813127];
    g=0.0051;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.16753392 -0.16913756];
    g=0.0052;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.08187133 0.00557782];
    g=0.0053;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.07310830 -1.00228339];
    g=0.0054;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.08035070 0.00581478];
    g=0.0055;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[-4.19961924 0.00561808];
    g=0.0056;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.67122615 -0.01047344];
    g=0.0057;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-5.67916315 0.04356798];
    g=0.0058;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.05393755 -0.50013171];
    g=0.0059;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[-3.95314156 0.00066767];
    g=0.0060;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.68415043 -0.01036295];
    g=0.0061;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-4.20566306 0.00645664];
    g=0.0062;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.05158731 -0.53835692];
    g=0.0063;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.60266786 -0.01118847];
    g=0.0064;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.23236475 -0.56840919];
    g=0.0065;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.07255971 0.00714058];
    g=0.0066;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.46739987 -0.00407004];
    g=0.0067;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.22889077 -0.64703548];
    g=0.0068;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.11522263 -0.87178876];
    g=0.0069;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.18480649 -0.18514782];
    g=0.0070;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.18567283 -0.18594008];
    g=0.0071;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.18653092 -0.18672375];
    g=0.0072;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.18738097 -0.18749903];
    g=0.0073;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.18822315 -0.18826611];
    g=0.0074;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.18905764 -0.18902518];
    g=0.0075;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.18988461 -0.18977641];
    g=0.0076;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19070422 -0.19051998];
    g=0.0077;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19151663 -0.19125605];
    g=0.0078;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19232200 -0.19198478];
    g=0.0079;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.19312047 -0.19270632];
    g=0.0080;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19391218 -0.19342083];
    g=0.0081;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19469727 -0.19412844];
    g=0.0082;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19547589 -0.19482930];
    g=0.0083;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19624815 -0.19552355];
    g=0.0084;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19701418 -0.19621130];
    g=0.0085;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.19777410 -0.19689270];
    g=0.0086;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19852804 -0.19756787];
    g=0.0087;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.19927610 -0.19823691];
    g=0.0088;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20001839 -0.19889996];
    g=0.0089;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.20075503 -0.19955712];
    g=0.0090;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20148612 -0.20020849];
    g=0.0091;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20221176 -0.20085419];
    g=0.0092;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20293204 -0.20149432];
    g=0.0093;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20364707 -0.20212897];
    g=0.0094;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20435693 -0.20275825];
    g=0.0095;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.20506172 -0.20338225];
    g=0.0096;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20576152 -0.20400106];
    g=0.0097;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20645642 -0.20461477];
    g=0.0098;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20714651 -0.20522346];
    g=0.0099;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.20783185 -0.20582722];
    g=0.0100;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20851253 -0.20642613];
    g=0.0101;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20918864 -0.20702028];
    g=0.0102;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.20986023 -0.20760973];
    g=0.0103;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21052739 -0.20819457];
    g=0.0104;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21119019 -0.20877487];
    g=0.0105;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.21184869 -0.20935070];
    g=0.0106;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21250296 -0.20992214];
    g=0.0107;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21315307 -0.21048924];
    g=0.0108;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21379908 -0.21105207];
    g=0.0109;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.21444105 -0.21161071];
    g=0.0110;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21507905 -0.21216522];
    g=0.0111;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21571313 -0.21271565];
    g=0.0112;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21634335 -0.21326207];
    g=0.0113;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21696978 -0.21380453];
    g=0.0114;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21759245 -0.21434310];
    g=0.0115;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.21821144 -0.21487783];
    g=0.0116;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21882678 -0.21540878];
    g=0.0117;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.21943854 -0.21593600];
    g=0.0118;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22004676 -0.21645954];
    g=0.0119;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.22065150 -0.21697945];
    g=0.0120;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22125279 -0.21749579];
    g=0.0121;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22185069 -0.21800860];
    g=0.0122;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22244534 -0.21851801];
    g=0.0123;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22304193 -0.21902813];
    g=0.0124;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22382886 -0.21968769];
    g=0.0125;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.22661751 -0.22194371];
    g=0.0126;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22813373 -0.22319457];
    g=0.0127;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.22930323 -0.22416548];
    g=0.0128;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23037528 -0.22505788];
    g=0.0129;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.23138066 -0.22589624];
    g=0.0130;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23233631 -0.22669401];
    g=0.0131;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23325276 -0.22745961];
    g=0.0132;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23413711 -0.22819871];
    g=0.0133;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23499444 -0.22891534];
    g=0.0134;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23582850 -0.22961253];
    g=0.0135;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.23664218 -0.23029259];
    g=0.0136;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23743777 -0.23095737];
    g=0.0137;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23821710 -0.23160835];
    g=0.0138;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.23898169 -0.23224674];
    g=0.0139;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.23973280 -0.23287358];
    g=0.0140;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24047150 -0.23348972];
    g=0.0141;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24119869 -0.23409590];
    g=0.0142;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24191515 -0.23469276];
    g=0.0143;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24261788 -0.23527626];
    g=0.0144;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24347253 -0.23610178];
    g=0.0145;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.24334610 -0.23570453];
    g=0.0146;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24376738 -0.23600680];
    g=0.0147;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24543870 -0.23788684];
    g=0.0148;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24595808 -0.23842340];
    g=0.0149;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[0.24656508 -0.23891258];
    g=0.0150;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[0.24407126 -0.23610723];
    g=0.0151;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-4.25315206 0.01824045];
    g=0.0152;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.25908044 -1.03430842];
    g=0.0153;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.25958245 -1.03457013];
    g=0.0154;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.25995843 -1.03475294];
    g=0.0155;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[-3.26033319 -1.03493428];
    g=0.0156;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.26070603 -1.03511349];
    g=0.0157;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02786911 0.01927248];
    g=0.0158;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02750782 0.01941015];
    g=0.0159;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[-4.25605498 0.01955226];
    g=0.0160;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.26218415 -1.03581732];
    g=0.0161;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-3.26255682 -1.03599212];
    g=0.0162;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[-4.25715205 0.01997165];
    g=0.0163;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.02928613 -1.03930337];
    g=0.0164;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.01953481 -1.03650326];
    g=0.0165;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.02471028 0.01990214];
    g=0.0166;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02460220 0.02053213];
    g=0.0167;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02416623 0.02053350];
    g=0.0168;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.01809366 -1.03716682];
    g=0.0169;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[3.01776226 -1.03733941];
    g=0.0170;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02317593 0.02109714];
    g=0.0171;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02282696 0.02124126];
    g=0.0172;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02247847 0.02138305];
    g=0.0173;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02212993 0.02152388];
    g=0.0174;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02178206 0.02166256];
    g=0.0175;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.02144126 0.02181238];
    g=0.0176;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02109467 0.02194833];
    g=0.0177;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02075852 0.02210204];
    g=0.0178;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.02041650 0.02224184];
    g=0.0179;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.02007613 0.02238239];
    g=0.0180;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01973999 0.02252867];
    g=0.0181;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01940377 0.02267236];
    g=0.0182;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01907600 0.02282981];
    g=0.0183;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01872017 0.02293137];
    g=0.0184;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01838305 0.02306641];
    g=0.0185;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.01807260 0.02324978];
    g=0.0186;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01774319 0.02339482];
    g=0.0187;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01740944 0.02352939];
    g=0.0188;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01707177 0.02365428];
    g=0.0189;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.01675670 0.02381466];
    g=0.0190;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01643526 0.02397105];
    g=0.0191;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01608166 0.02406007];
    g=0.0192;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.00969057 -1.04070358];
    g=0.0193;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.00945279 -1.04087874];
    g=0.0194;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.00909181 -1.04100154];
    g=0.0195;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[3.00874733 -1.04112976];
    g=0.0196;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[3.00839457 -1.04125307];
    g=0.0197;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01413769 0.02488329];
    g=0.0198;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

    IC=[2.01396387 0.02528813];
    g=0.0199;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);
    
    IC=[2.01339663 0.02497066];
    g=0.0200;
    fprintf('"%.4f": \n', g);
    [t,Z,X]=SimpleWalker(IC,animate,poincare,rootfind,per,g,demo_num);

end
