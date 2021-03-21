% Given two dual quaternion D1, D2
% Denote first quaternion part of D1 as D11
% And second quaternion part D1 (the one followed by epsilon) as D12

% Given:
% D1 = (1, 2i, j, k) + (1, 2i, j, k)epsilon
% D2 = (1, i, 3j, k) + (1, i, j, k)epsilon
% we can split D1 into (w1,v1) + (w2,v2)epsilon, similarly we translate D2
v1 = [2 1 1];
v2 = [2 1 1];
v3 = [1 3 1];
v4 = [1 1 1];
w1 = 1;
w2 = 1;
w3 = 1;
w4 = 1;

% Note the multiply operation below is a quaternion multiplication, not a
% matrix or number multiplication

% D11 times D21
[Aw,Av] = multiply_quaternion(w1,v1,w3,v3);
% D11 times D22
[Bw,Bv] = multiply_quaternion(w1,v1,w4,v4);
% D12 times D21
[Cw,Cv] = multiply_quaternion(w2,v2,w3,v3);
% Since epsilon squared equals zero, we skip D12 times D22

% the resulting dual quaternion in two parts:
result_first = [Aw,Av];
result_epsilon = [Bw+Cw,Bv+Cv];

q1 = [1 2 1 1];
epsilon_q1 = [1 2 1 1];
q2 = [1 1 3 1];
eqsilon_q2 = [1 1 1 1];
[result_first,result_epsilon] = multiply_dual_quaternion(q1,epsilon_q1,q2, eqsilon_q2)

% calculate conjugate of quaternion
q2c = conjugate(q2)

% rotation with 90 degrees around k counter clock wise quaternion example
% along k = along (0i 0j 1k)
degree = 90;
q_rot = [cosd(90/2) 0*sind(90/2) 0*sind(90/2) 1*sind(90/2)]

% translation of (2,2,2) example
qt = [1 0 0 0]
qt_epsilon = 0.5*[0 2 2 2]

function [w,v] = multiply_quaternion(w1,v1,w2,v2)
% Multiply two quaternions base on quaternion multiplication rule:
% (w1,v1)(w2,v2) = (w1w2 - v1.v2, w1v2 + w2v1 + v1 x v2)
% '.' represents vector dot product and 'x' represents vector cross product
    w = w1*w2 - dot(v1,v2);
    v = w1*v2 + w2*v1 + cross(v1,v2);
end


function [result_first,result_epsilon] = multiply_dual_quaternion(q1,epsilon_q1,q2, eqsilon_q2)
    % Note the multiply operation below is a quaternion multiplication, not a
    % matrix or number multiplication

    % D11 times D21
    [Aw,Av] = multiply_quaternion(q1(1),q1(2:4),q2(1),q2(2:4));
    % D11 times D22
    [Bw,Bv] = multiply_quaternion(q1(1),q1(2:4),eqsilon_q2(1),eqsilon_q2(2:4));
    % D12 times D21
    [Cw,Cv] = multiply_quaternion(epsilon_q1(1),epsilon_q1(2:4),q2(1),q2(2:4));
    % Since epsilon squared equals zero, we skip D12 times D22
    
    % the resulting dual quaternion in two parts:
    result_first = [Aw,Av];
    result_epsilon = [Bw+Cw,Bv+Cv];
end


% calculate the conjugate of a quaternion
function [cq] = conjugate(quaternion)
    w = quaternion(1);
    v = quaternion(2:4);
    cq = [w,-v];
end
