function [m] = proj_matrix(points_fr, points_to)
A = [];
b = [];
for i = 1:size(points_fr,2)
    x_fr_i = points_fr(1,i);
    x_to_i = points_to(1,i);
    y_fr_i = points_fr(2,i);
    y_to_i = points_to(2,i);
    A = [A; 
         x_fr_i, y_fr_i, 1, 0, 0, 0, -x_fr_i*x_to_i, -y_fr_i*x_to_i;
         0, 0, 0, x_fr_i, y_fr_i, 1, -x_fr_i*y_to_i, -y_fr_i*y_to_i;];
    b = [b; x_to_i; y_to_i];
end

x = A\b; 
m = [x(1) x(2) x(3);
     x(4) x(5) x(6);
     x(7) x(8) 1]'; 
end