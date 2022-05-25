%% Frame Definition & Transformations

A = trotx(0) % Definition of frame {A}

T1 = transl(3,2,1); % Translation along x,y,z axes by 3,2,1 units. Yields 4x4 homogeneous transformation matrix with zero rotation.
T2 = trotx(60); % Rotation along x-axis by 60 degrees. Yields 4x4 homogeneous transformation matrix with zero translation.

B1 = T1*T2 % Frame {B} case 1
B2 = T2*T1 % Frame {B} case 2

%% Comparing the Transformations

if B1 == B2
    fprintf("Both Homogeneous Transformation Matrices Are Same.\n");
else
    fprintf("Both Homogeneous Transformation Matrices Are NOT Same.\n");
end

%% Frame Visualization

Bounds = [-1 5 -1 3 -1 3.5]; % Axis bounds [xmin xmax ymin ymax zmin zmax]

figure('Name','Frame Visualization','NumberTitle','off');
trplot(A, 'frame', 'A', 'axis', Bounds, 'rgb', 'arrow'); % Plot frame {A}
hold on;
tranimate(A, B1, 'frame', 'B_1', 'axis', Bounds, 'rgb', 'arrow'); % Animate frame {B} case 1
hold on;
tranimate(A, B2, 'frame', 'B_2', 'axis', Bounds, 'rgb', 'arrow'); % Animate frame {B} case 2
hold off;
