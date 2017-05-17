function [x]=click_image(filename,npts,x_guess)
RADIUS  = 50;
[ima,map] = imread(filename);
[m,n] = size(ima);
figure(1); clf; hold off; imagesc(ima); colormap(gray(256));
drawnow;

if(nargin==1)
    n_points = input('How many points?');
    [x,y] = ginput(n_points);
    hold on; plot(x,y,'+r'); hold off;
    drawnow;
elseif(nargin==2)
    n_points = npts;
    [x,y] = ginput(n_points);
    hold on; plot(x,y,'+r'); hold off;
    drawnow;
elseif(nargin==3)
    x = x_guess(1,:)' + 2;
    y = x_guess(2,:)' + 2;
    n_points = size(x,2);
end

figure(2); colormap(gray(256));
for p=1:n_points
    i = round(y(p));
    j = round(x(p));
    x1 = max(1,j-RADIUS);
    x2 = min(n,j+RADIUS);
    y1 = max(1,i-RADIUS);
    y2 = min(m,i+RADIUS);
    subima = ima(y1:y2,x1:x2);
    image(subima); hold on;
    plot(x(p)-x1, y(p)-y1, '+r'); drawnow;
    [x_new, y_new] = ginput(1);
    x(p) = x1 + x_new;
    y(p) = y1 + y_new;
    plot(x(p)-x1, y(p)-y1, '+g'); drawnow;
end

figure(1); hold on; plot(x,y,'+g'); hold off; drawnow;
x = [x,y]';