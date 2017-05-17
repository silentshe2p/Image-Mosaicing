img1 = 'car1.jpg';
img2 = 'car2.jpg';
img3 = 'car3.jpg';
imds = imageDatastore({img1, img2, img3});
tforms(3) = eye(3);

% Find corresponding points
% points1 = click_image(img1,10);
% save('p1.mat','points1');
% points2 = click_image(img2,10);
% save('p2.mat','points2');
% points3 = click_image(img3,10);
% save('p3.mat','points3');

% Load found corresponding points
m1 = matfile('p1.mat');
m2 = matfile('p2.mat');
m3 = matfile('p3.mat');
points1 = m1.points1;
points2 = m2.points2;
points3 = m3.points3;

% Translational mosaic
T21 = trans_matrix(points1,points2);
tforms(1) = T21;
T23 = trans_matrix(points3,points2);
tforms(3) = T23;
t_mosaic = stitch(tforms, imds);
% figure;
% imshow(t_mosaic);
imwrite(t_mosaic, 't_mosaic.jpg');

% Affine mosaic
A21 = proj_matrix(points1,points2);
A21(1,3) = 0;
A21(2,3) = 0;
tforms(1) = A21;
A23 = proj_matrix(points3,points2);
A23(1,3) = 0;
A23(2,3) = 0;
tforms(3) = A23;
a_mosaic = stitch(tforms, imds);
% figure;
% imshow(a_mosaic);
imwrite(a_mosaic, 'a_mosaic.jpg');

% Projective mosaic
G21 = proj_matrix(points1,points2);
tforms(1) = G21;
G23 = proj_matrix(points3,points2);
tforms(3) = G23;
p_mosaic = stitch(tforms, imds);
% figure;
% imshow(p_mosaic);
imwrite(p_mosaic, 'p_mosaic.jpg');






