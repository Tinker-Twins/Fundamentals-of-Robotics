%% Define DH Parameters
L(1) = Link([0 0.335 0.075 -pi/2]);
L(2) = Link([0 0 0.270 0]);
L(2).offset = -pi/2;
L(3) = Link([0 0 0.090 -pi/2]);
L(4) = Link([0 0.295 0 pi/2]);
L(5) = Link([0 0 0 -pi/2]);
L(6) = Link([0 0.080 0 0]);

%% Forward Kinematics
Robot = SerialLink(L, 'name', 'KUKA KR5 Sixx R650');

Robot.fkine([0 0 0 0 0 0])

figure('NumberTitle', 'off', 'Name', 'Forward Kinematics');
Robot.plot([0 0 0 0 0 0]);

%% Define Joint Angle Variables
th1 = 0;
th2 = 0;
th3 = 0;
th4 = 0;
th5 = 0;
th6 = 0;

%% Animation
for i = 0:0.05:pi/4
    th2 = 2*i;
    Robot.plot([th1 th2 th3 th4 th5 th6]);
end
for i = pi/4:-0.05:0
    th2 = 2*i;
    Robot.plot([th1 th2 th3 th4 th5 th6]);
end
for i = 0:0.05:pi/4
    th1 = 4*i;
    th2 = i;
    th3 = i;
    th4 = i/2;
    th5 = i/4;
    th6 = i;
    Robot.plot([th1 th2 th3 th4 th5 th6]);
end
for i = pi/4:-0.05:0
    th1 = 4*i;
    th2 = i;
    th3 = i;
    th4 = i/2;
    th5 = i/4;
    th6 = i;
    Robot.plot([th1 th2 th3 th4 th5 th6]);
end