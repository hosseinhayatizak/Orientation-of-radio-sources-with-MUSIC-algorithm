%% project 1  MUSIC algoritm  ((hossein hayati))  

clc;
clear all;

data = load('z.mat'); 

name = fieldnames(data); 
data = data.(name{1});


fc = 20e6;
c = 3e8;
lambda = c / fc;
d = lambda / 2;
N = size(data, 1); 
T = size(data, 2);

R = (data * data') / T;

[eigvect, eigvalue] = eig(R);
[eigvaluesort, idx] = sort(diag(eigvalue), 'descend');
eigvectsort = eigvect(:, idx);


sources = 2;
sigsubspace = eigvectsort(:, 1:sources);
noisesubspace = eigvectsort(:, sources+1:end);

angles = -90:0.1:90;
nangles = length(angles);
Pmusic = zeros(1, nangles);


for i = 1:nangles
    theta = angles(i) * pi / 180;
    a_theta = exp(-1j * 2 * pi * d / lambda * (0:N-1)' * sin(theta));
    Pmusic(i) = 1 / (a_theta' * noisesubspace * noisesubspace' * a_theta);
end


Pmd = 10 * log10(abs(Pmusic));

plot(angles, Pmd);
title('MUSIC Pseudospectrum');
xlabel('Angle (degrees)');
ylabel('Pseudospectrum (dB)');
grid on;


[~, peak] = findpeaks(Pmd);
estimatangles = angles(peak);

hold on;
plot(angles(peak), Pmd(peak), 'rv', 'MarkerFaceColor', 'r');
for i = 1:length(peak)
    text(angles(peak(i)), Pmd(peak(i)), sprintf('  %.1f°', angles(peak(i))), 'VerticalAlignment', 'bottom', 'HorizontalAlignment', 'right', 'FontSize', 10);
end
hold off;

disp('Estimated angles of arrival:');
disp(estimatangles);