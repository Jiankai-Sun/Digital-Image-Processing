close all;clear;clc;
%PCA restore
img1 = imread('../fig/washingtonDC/WashingtonDC_Band1.tif');
img2 = imread('../fig/washingtonDC/WashingtonDC_Band2.tif');
img3 = imread('../fig/washingtonDC/WashingtonDC_Band3.tif');
img4 = imread('../fig/washingtonDC/WashingtonDC_Band4.tif');
img5 = imread('../fig/washingtonDC/WashingtonDC_Band5.tif');
img6 = imread('../fig/washingtonDC/WashingtonDC_Band6.tif');
imgs = {img1, img2, img3, img4, img5, img6};

[h, w] = size(img1);
vectors = zeros(h * w, 6);
ctr = 1;
for i=1:h
    for j=1:w
        for k=1:6
            vectors(ctr, k) = imgs{k}(i, j);
        end
        ctr = ctr + 1;
    end
end
mx = zeros(1, 6);
for i = 1:h * w
    mx = mx + vectors(i, :);
end
mx = mx' / (h * w);
cx = zeros(6, 6);
for i=1:h * w
    cx = cx + vectors(i, :)' * vectors(i, :);
end
cx = cx / (h * w);
cx = cx - mx * mx';
[A, ~] = eig(cx);
A = flipud(A);
PCs = 2;
vector_metas = zeros(h * w, PCs);
for i=1:h * w
    vector_metas(i, :) = (A(1:PCs,:) * (vectors(i, :)' - mx))';
end
vector_reconstructs = zeros(h * w, 6);
for i=1:h * w
    vector_reconstructs(i, :) = (A(1:PCs,:)' * vector_metas(i, :)' + mx)';
end
reconstructs = {img1, img2, img3, img4, img5, img6};
ctr = 1;
for i=1:h
    for j=1:w
        for k=1:6
            reconstructs{k}(i, j) = vector_reconstructs(ctr, k);
        end
        ctr = ctr + 1;
    end
end

imwrite(uint8(reconstructs{1}), '../result/PCAReconstruct/PCAreconstruct1.jpg');
imwrite(uint8(reconstructs{2}), '../result/PCAReconstruct/PCAreconstruct2.jpg');
imwrite(uint8(reconstructs{3}), '../result/PCAReconstruct/PCAreconstruct3.jpg');
imwrite(uint8(reconstructs{4}), '../result/PCAReconstruct/PCAreconstruct4.jpg');
imwrite(uint8(reconstructs{5}), '../result/PCAReconstruct/PCAreconstruct5.jpg');
imwrite(uint8(reconstructs{6}), '../result/PCAReconstruct/PCAreconstruct6.jpg');