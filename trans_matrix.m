function [m] = trans_matrix(points_fr, points_to)
A = [];
b = [];
for i = 1:size(points_fr,2)
    x_fr_i = points_fr(1,i);
    x_to_i = points_to(1,i);
    y_fr_i = points_fr(2,i);
    y_to_i = points_to(2,i);
    A = [A; 
         1, 0, x_fr_i;
         0, 1, y_fr_i];
    b = [b; x_to_i; y_to_i];
end

x = A\b; 
m = [1 0 x(1);
     0 1 x(2);
     0 0 1]'; 
end