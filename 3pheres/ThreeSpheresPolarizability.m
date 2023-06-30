
fileloc1='C:\Users\sumuk\OneDrive - purdue.edu\Purdue\2023Summer\Phy699PhD\PolarizationCalc\MultiSphGmsh\Sp3\';
filename1='outpolfinal.csv';
file1=strjoin({fileloc1,filename1},'');
data=readmatrix(file1)';

fileloc2='C:\Users\sumuk\OneDrive - purdue.edu\Purdue\2023Summer\Phy699PhD\PolarizationCalc\MultiSphGmsh\Sp3\';
filename2='outvolfinal.csv';
file2=strjoin({fileloc1,filename2},'');
data2=readmatrix(file2)';
%%
% LD=[1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9]; 
% LD=data(1,:);
% z0=(LD-1);
% vol=4*pi/3+2*pi*z0-2*pi*z0.^3/3;
% 
% %%
% figure(1);
% hold on; grid off;
% % legend(sprintf('Magnetic Field %g (T)', Bzz));
% ax = gca;
% ax.FontSize = 20;
% set(gca,'FontSize',20);
% set(get(gca,'YLabel'),'Fontsize',20)
% set(get(gca,'XLabel'),'Fontsize',20)
% set(gca,'XMinorTick','on','YMinorTick','on')
% set(gca,'linewidth',2.0)
% box on;
% % set(gca,'Ydir','reverse')
% % set(gca,'XTick',0:.2:4);
% % xlim([2.6,2.8]);
% % set(gca,'YTick',.80:.005:1.40);
% % ylim([.995,1.005]);
% xlabel('L/D','fontsize',18);
% ylabel('\chi ','fontsize',18);
% 
% scatter(LD,data(3,:)./vol,'linewidth',2); 
% % plot(LD,data(:,1)'./vol,'linewidth',2);
% scatter(LD,data(7,:)./vol,'linewidth',2);
% scatter(LD,data(11,:)./vol,'linewidth',2);
% legend('XX', 'YY','ZZ');

polxx=data(4,:);polxxx=reshape(polxx,[11 11]);
polyy=data(8,:);polyyy=reshape(polyy,[11 11]);
polzz=data(12,:);polzzz=reshape(polzz,[11 11]);
hr=data(2,1:11);
ld=data(1,1:11:121);

vol=data2(9,:);vols=reshape(vol,[11 11]);

figure(2);
hold on;
title('Polarizability XX');
xxpol=polxxx./vols;
% imshow(xxpol,[.75 .9],'InitialMagnification',10000); 
% imshow(,'InitialMagnification',10000); 
imshow(xxpol,[min(min(xxpol)) max(max(xxpol))],'InitialMagnification',10000); 
clrbr=colorbar;
ylabel(clrbr,'Polarizability ','FontSize',16,'Rotation',270);
clrbr.Label.Position(1) =5;
colormap('jet');
ylabel('hr');
xlabel('ld');
axis on;
xticklabels(hr);
yticklabels(ld);
% xticks([0:1:250]);
% yticks([0:1:250]);
% ax = gca;
% set(gca,'XTick',2:2:10);
set(gca,'FontSize',15);

figure(3);
hold on;
title('Polarizability YY');
yypol=polyyy./vols;
% imshow(yypol,[.75 .9],'InitialMagnification',10000); 
imshow(yypol,[min(min(yypol)) max(max(yypol))],'InitialMagnification',10000); 
clrbr=colorbar;
ylabel(clrbr,'Polarizability ','FontSize',16,'Rotation',270);
clrbr.Label.Position(1) =5;
colormap('jet');
ylabel('hr');
xlabel('ld');
axis on;
xticklabels(hr);
yticklabels(ld);
% xticks([0:1:250]);
% yticks([0:1:250]);
% ax = gca;
% set(gca,'XTick',2:2:10);
set(gca,'FontSize',15);

figure(4);
hold on;
title('Polarizability ZZ');
zzpol=polzzz./vols;
% imshow(zzpol,[.75 .9],'InitialMagnification',10000); 
imshow(zzpol,[min(min(zzpol)) max(max(zzpol))],'InitialMagnification',10000); 
clrbr=colorbar;
ylabel(clrbr,'Polarizability ','FontSize',16,'Rotation',270);
clrbr.Label.Position(1) =5;
colormap('jet');
ylabel('hr');
xlabel('ld');
axis on;
xticklabels(hr);
yticklabels(ld);
% xticks([0:1:250]);
% yticks([0:1:250]);
% ax = gca;
% set(gca,'XTick',2:2:10);
set(gca,'FontSize',15);