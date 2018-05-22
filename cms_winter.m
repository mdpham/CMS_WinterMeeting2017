%% BARNSLEY FERN
close all
% Four map IFS affine contraction transformations in two dimension [x;y]
s1 = [[0 0];[0 0.16]];
s2 = [[0.85 0.04];[-0.04 0.85]];
s3 = [[0.2 -0.26];[0.23 0.22]];
s4 = [[-0.15 0.28];[0.26 0.24]];
t1 = [0; 0];
t2 = [0; 1.6];
t3 = [0; 1.6];
t4 = [0; 0.44];
p1 = 0.01; p2 = 0.85; p3 = 0.07; p4 = 0.07;
% Chaos
p1 = 0.05; p2 = 0.6; p3 = 0.175; p4 = 0.175;
s2 = [[0.85 -0.04];[0.04 0.85]];
% IFS functions
w1 = @(x) s1*x + t1;
w2 = @(x) s2*x + t2;
w3 = @(x) s3*x + t3;
w4 = @(x) s4*x + t4;

axis([-4 4 0 10])

M = 35000;        % Number of iterations
M = M+1; % for capturing frames
fr = 1
initial = [rand();rand()];   % Initial point
x = [initial];
x1 = [[];[]];
x2 = [[];[]];
x3 = [[];[]];
x4 = [[];[]];
h = figure;
hold on;
ax = gca;
ax.Visible = 'off';
axis([-3 3 0 10])
gif = false; % switch
for i = 1:M
    xn = x(:,i);
    p = rand();
    if p < p1
        xn = w1(xn);
        x1(:,end+1) = xn;
    elseif p < p1+p2
        xn = w2(xn);
        x2(:,end+1) = xn;
    elseif p < p1+p2+p3
        xn = w3(xn);
        x3(:,end+1) = xn;
    else
        xn = w4(xn);
        x4(:,end+1) = xn;
    end
    x(:,end+1) = xn;
    if mod(i,500)==0
        disp('i');
        disp(i);
        scatter(x1(1,:),x1(2,:),1, 'w.')
        scatter(x2(1,:),x2(2,:),1, 'r.')
        scatter(x3(1,:),x3(2,:),1, 'g.')
        scatter(x4(1,:),x4(2,:),1, 'b.')
        drawnow
%         saveas(gca,['barnsley/','barnsley-',num2str(fr),'.png'],'png');
%         fr = fr+1;
        frame = getframe(h);
        im = frame2im(frame);
        [imind,cm] = rgb2ind(im,256);
        if ~gif
            gif = ~gif;
            imwrite(imind,cm,'barnsley_chaos.gif','gif','Loopcount',inf);
        else
            imwrite(imind,cm,'barnsley_chaos.gif','gif','WriteMode','append');
        end
    end
end
hold off;

%% Sierpinski Carpet
close all
% Eight map IFS affine contraction transformations in two dimension [x;y]
s1 = [[1/3 0];[0 1/3]]; % same for all 8 transformations
t1 = [0;0];
t2 = [0;1/3];
t3 = [0;2/3];
t4 = [1/3;0];
t5 = [1/3;2/3];
t6 = [2/3;0];
t7 = [2/3;1/3];
t8 = [2/3;2/3];

w1 = @(x) s1*x + t1;
w2 = @(x) s1*x + t2;
w3 = @(x) s1*x + t3;
w4 = @(x) s1*x + t4;
w5 = @(x) s1*x + t5;
w6 = @(x) s1*x + t6;
w7 = @(x) s1*x + t7;
w8 = @(x) s1*x + t8;



M = 1000000;        % Number of iterations
fr = 1
x0 = [rand();rand()];   % Initial point
x1 = [[];[]];
x2 = [[];[]];
x3 = [[];[]];
x4 = [[];[]];
x5 = [[];[]];
x6 = [[];[]];
x7 = [[];[]];
x8 = [[];[]];
x = [x0];
hold on
% axis([0 1 0 1])
for i = 1:M
    xn = x(:,i);
    p = rand();
    if p < 1/8
        xn = w1(xn);
        x1(:,end+1) = xn;
    elseif p < 2/8
        xn = w2(xn);
        x2(:,end+1) = xn;
    elseif p < 3/8
        xn = w3(xn);
        x3(:,end+1) = xn; 
    elseif p < 4/8
        xn = w4(xn);
        x4(:,end+1) = xn;
    elseif p < 5/8
        xn = w5(xn);
        x5(:,end+1) = xn;
    elseif p < 6/8
        xn = w6(xn);
        x6(:,end+1) = xn;
    elseif p < 7/8
        xn = w7(xn);
        x7(:,end+1) = xn;
    else
        xn = w8(xn);
        x8(:,end+1) = xn;
    end
    x(:,end+1) = xn;
end
scatter(x1(1,:),x1(2,:),1,rand(1,3), '.')
scatter(x2(1,:),x2(2,:),1,rand(1,3), '.')
scatter(x3(1,:),x3(2,:),1,rand(1,3), '.')
scatter(x4(1,:),x4(2,:),1,rand(1,3), '.')
scatter(x5(1,:),x5(2,:),1,rand(1,3), '.')
scatter(x6(1,:),x6(2,:),1,rand(1,3), '.')
scatter(x7(1,:),x7(2,:),1,rand(1,3), '.')
scatter(x8(1,:),x8(2,:),1,rand(1,3), '.')
% axis([0 1/3 0 1/3]) % for zooming on bottom left, do multiple times
hold off;