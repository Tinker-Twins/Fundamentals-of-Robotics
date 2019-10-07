%% SCARA Robot

L(1) = Link([0 0.5 1 0]); % First '0' doesn't mean 0. MATLAB takes it in as a variable 'theta' because 5th term is 0 (or null), which defines a revolute joint.
L(2) = Link([0 0 1 0]);
L(3) = Link([0 0 0 0 1]);  % Second '0' doesn't mean 0. MATLAB takes it in as a a variable 'd' because 5th term is 1, which defines a prismatic joint.
L(3).qlim = [0, 1];
L(4) = Link([0 0.5 0 pi]);

SCARA_Robot = SerialLink(L, 'name', 'SCARA')

FK_Home_Position = SCARA_Robot.fkine([0 0 0 0])

figure('NumberTitle', 'off', 'Name', 'SCARA');
SCARA_Robot.plot([0 0 0 0]);
