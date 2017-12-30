img = imread('../fig/Fig1.jpg');
% img = imread('../fig/Fig2.jpg');
[M,N] = size(img);

% histogram
a = double(min(min(img)));
b = double(max(max(img)));
h = zeros(1, b-a+1);
for i = 1:M
    for j = 1:N
        h(img(i, j) - a + 1) = h(img(i, j) - a + 1) + 1;
    end
end
x = 0 : (b-a);
figure(1), bar(x, h, 0.001), xlim([0 b-a]);
ylim([0 max(h)]);

% transformation function
cumu = zeros(1, b-a+1);
cumu(1) = h(1);
for k = 2:b-a+1
    cumu(k) = cumu(k-1) + h(k);
end
s = M * N / 256;
eq = zeros(1, b-a+1);
q = 0;
for p = 1:(b-a)
    while cumu(p) > s*q
        q = q + 1;
    end
    if q > 255    
        q = 255;
    end
    eq(p+1) = q;
end
figure(2), plot(x, eq), xlim([0, b-a]);

% equalization
imgEq = zeros(M,N);
h2 = zeros(1, 256);
for i=1:M
    for j=1:N
        tmp = eq(img(i, j) - a + 1);
        imgEq(i, j) = tmp;
        h2(tmp+1) = h2(tmp+1) + 1;
    end
end
figure(3), imshow(uint8(imgEq));
y = 1:256;
figure(4), bar(y, h2, 0.001), xlim([0,255]);