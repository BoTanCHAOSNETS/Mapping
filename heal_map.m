clear all;

sym_dia = 40;
Sigma = [0 sym_dia; sym_dia 0];
Sigma = Spd_Mat(Sigma);
x1 = -180:1:180;
x2 = 0:1:30; 


mu_1 = [90 10];
[X1,X2] = meshgrid(x1,x2);
F_1 = mvnpdf([X1(:) X2(:)],mu_1,Sigma);
F_1 = reshape(F_1,length(x2),length(x1));

mu_2 = [-120 5];
F_2 = mvnpdf([X1(:) X2(:)],mu_2,Sigma);
F_2 = reshape(F_2,length(x2),length(x1));

F = F_1 + F_2;
F = flipud(F);
imagesc(F)
% surf(x1,x2,F);
% caxis([min(F(:))-.5*range(F(:)),max(F(:))]);
% % axis([-3 3 -3 3 0 .4])
% xlabel('x1'); ylabel('x2'); 
% zlabel('Probability Density');