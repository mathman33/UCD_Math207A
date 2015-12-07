function [t,Z,X]=SimpleWalker(Z0,animate,poincare,rootfind,per,Gam,demo_num)
%A function that simulates the simplest walker of Garcia et al. 1998.  It
%returns a vector of times (t), and the system's state at each time (Z)
%where Z(1)=theta, Z(2)=dtheta, for the right leg and Z(3) and Z(4) are
%those respective values for the left leg.  Finally, the function returns a
%vector X, which is the values of theta and dtheta at the Poincare section,
%just after heelstrike.


if rootfind==1%This performs a root find to locate a fixed point
    options = optimset('TolFun',1e-12,'TolX',1e-12,'Display','on');
    Z0_step=fsolve(@RootFun,Z0,options,Gam,per);
    %the parameter PER determines the period of the fixed point.
else
    Z0_step=Z0;
end

t(1)=0;
theta=Z0_step(1);
dtheta=Z0_step(2);

Z0=[theta dtheta 2*theta 0];

Z=Z0;
Z(3)=Z(1)-Z(3);
Z(4)=Z(2)-Z(4);
footdown(1)=0;

%you can change this value if you want to simulate more steps -- here, I've
%picked 10 steps.  Obviously if you're looking for period 16 or higher motion, you
%will need to look at more steps.
num_steps=10;

for ii=1:num_steps
    %each time through this loop simulates a single step
    [ta,Za]=StepSim(Z0,Gam);
        
    Z_plus=Collision(Za(end,:)');
    Z0=Z_plus;
    % fprintf('theta = %0.8f \t dtheta = %0.8f\n',Z0(1),Z0(2));
    fprintf('%0.8f\n',Z0(1));
    X(ii,:)=Z0(1:2);
    t=[t;t(end)+1e-10+ta];
    Za(:,3)=Za(:,1)-Za(:,3);
    Za(:,4)=Za(:,2)-Za(:,4);
    if mod(ii,2)==0
        Zb(:,1:2)=Za(:,3:4);
        Zb(:,3:4)=Za(:,1:2);
        Za=Zb;
        clear Zb
        footdown_a=ones(1,length(ta));
    else
        footdown_a=zeros(1,length(ta));
    end
    Z=[Z;Za];
    footdown=[footdown footdown_a];
end

if animate==1
    %animate the results
    Fig_Num=3;
    WalkMovie(Fig_Num,t,Z,footdown,demo_num,Gam);
end

if poincare==1
    %take a poincare section
    figure(6);
    clf;
    plot(X(:,1),X(:,2),'k.');
    axis([0.20 0.25 -0.25 -0.20]);
end


function nothin = WalkMovie(Fig_Num,t,Z,footdown,demo_num,Gam)

num_frames=501;
    
figure(Fig_Num);
clf
set(gcf,'position',[630 734 1514 590]);
axis off

t_int=linspace(0,t(end),num_frames);

theta1_int=interp1(t,Z(:,1),t_int);
theta2_int=interp1(t,Z(:,3),t_int);
f_now=interp1(t,footdown,t_int);


x_foot=0;
y_foot=-1;
switch_foot=0;

for ii=1:length(t_int)
    L1=[0;-1];
    L2=[0;-1];
    theta_1=theta1_int(ii);
    theta_2=theta2_int(ii);
    R1=[cos(theta_1) -sin(theta_1);
        sin(theta_1) cos(theta_1)];
    
    R2=[cos(theta_2) -sin(theta_2);
        sin(theta_2) cos(theta_2)];
    
    subplot(1,2,1);
    L1_now=R1*L1;
    L2_now=R2*L2;
    
    if f_now(ii)==0
        if switch_foot==1
            x_foot=x_cg+sin(theta_1);
            y_foot=y_cg-cos(theta_1);
            switch_foot=0;
        end
        x_cg=x_foot-sin(theta_1);
        y_cg=y_foot+cos(theta_1);
        plot(x_cg,y_cg,'ko',[x_foot x_cg],[y_foot y_cg],'b',[x_cg x_cg+sin(theta_2)],[y_cg y_cg-cos(theta_2)],'r',[-5 6],-1*ones(1,2),'k');
    else
        if switch_foot==0
            x_foot=x_cg+sin(theta_2);
            y_foot=y_cg-cos(theta_2);
            switch_foot=1;
        end
        x_cg=x_foot-sin(theta_2);
        y_cg=y_foot+cos(theta_2);
        plot(x_cg,y_cg,'ko',[x_foot x_cg],[y_foot y_cg],'r',[x_cg x_cg+sin(theta_1)],[y_cg y_cg-cos(theta_1)],'b',[-5 6],-1*ones(1,2),'k');
    end
    axis([-0.5 6 -2 4.5]);
    subplot(1,2,2);
    plot(Z(:,1),Z(:,3),theta1_int(ii),theta2_int(ii),'ro');
    axis([-0.4 0.3 -0.4 0.3]);
    % drawnow
    % if mod(ii, 5) == 0
    %     print(sprintf('demo_%d/Walker_demo_%d_%.3f_%.3d', demo_num, demo_num, Gam, ii), '-r300' ,'-dpng')
    % end
    % saveas(gcf,'file_%.3d.png', ii)
    % MOVIE(ii) = getframe(figure);
end

% MOVIE2AVI(movie(MOVIE),test.avi);

function Zer = RootFun(Z0,Gam,per)

Z_start=Z0;
for ii=1:per
    [t,Z] = StepSim(Z_start,Gam);
    Z_plus = Collision(Z(end,:)');
    Z_start = [Z_plus(1);Z_plus(2)];
end

Zer=Z0(:)-[Z_plus(1);Z_plus(2)];

function [t,Z] = StepSim(Z0,Gam)
theta=Z0(1);
dtheta=Z0(2);

Z_0=[theta;dtheta;2*theta;0];

options=odeset('events',@events,'abstol',1e-13,'reltol',1e-13);
[tout,zout,te,ze,ie] = ode45(@RHS_fun,[0 5],Z_0,options,Gam);

t=tout;
Z=zout;

function [value,isterminal,direction] = events(t,Z,Gam)
Phi=Z(3);
Theta=Z(1);
value = Phi-2*Theta;

tol=0.1;
if abs(Theta-Phi)>tol & t>0.1
    isterminal=1;
else
    isterminal=0;
end

direction=1;


function dZ = RHS_fun(t,Z,Gam)
Theta=Z(1);
dTheta=Z(2);
Phi=Z(3);
dPhi=Z(4);

ddTheta=sin(Theta-Gam);
ddPhi=ddTheta+dTheta^2*sin(Phi)-cos(Theta-Gam)*sin(Phi);

dZ=[dTheta;ddTheta;dPhi;ddPhi];

function Z_plus = Collision(Z_minus)

Theta=Z_minus(1);

M=[-1 0 0 0;
    0 cos(2*Theta) 0 0;
    -2 0 0 0;
    0 cos(2*Theta)*(1-cos(2*Theta)) 0 0];

Z_plus=M*Z_minus;