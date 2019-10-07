% Translation and Rotation

%{ 
PROBLEM:
Compute Trans(3,2,1) followed by Rot(z,60).
Expected Solution:
                    [cos60 -sin60 0 3;
                     sin60  cos60 0 2;
                     0      0     1 1;
                     0      0     0 1]
%}

R = rotz(60) % Rotation along z by 60 degrees. Yields 3x3 Rotation Matrix.
A = transl(3,2,1) % Translation along x,y,z by 3,2,1 units. Yields 4x4 Homogenious Transformation Matrix with zero rotation.
B = trotz(60) % Rotation along z by 60 degrees. Yields 4x4 Homogenious Transformation Matrix with zero translation.
T = A*B % Yields Homogenious Transformation Matrix with rotation as well as translation. Always use (transl*trot).