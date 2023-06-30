fileloc1='C:\Users\sumuk\OneDrive - purdue.edu\Purdue\2023Summer\Phy699PhD\PolarizationCalc\MultiSphGmsh\Sp3\';
filename1='outpolfinal.csv';
file1=strjoin({fileloc1,filename1},'');
data=readmatrix(file1)';

%%
% LD=[1.1 1.2 1.3 1.4 1.5 1.6 1.7 1.8 1.9]; 
LD=data(1,:);
z0=(LD-1);
vol=4*pi/3+2*pi*z0-2*pi*z0.^3/3;

%%
figure(1);
hold on; grid off;
% legend(sprintf('Magnetic Field %g (T)', Bzz));
ax = gca;
ax.FontSize = 20;
set(gca,'FontSize',20);
set(get(gca,'YLabel'),'Fontsize',20)
set(get(gca,'XLabel'),'Fontsize',20)
set(gca,'XMinorTick','on','YMinorTick','on')
set(gca,'linewidth',2.0)
box on;
% set(gca,'Ydir','reverse')
% set(gca,'XTick',0:.2:4);
% xlim([2.6,2.8]);
% set(gca,'YTick',.80:.005:1.40);
% ylim([.995,1.005]);
xlabel('L/D','fontsize',18);
ylabel('\chi ','fontsize',18);

scatter(LD,data(3,:)./vol,'linewidth',2); 
% plot(LD,data(:,1)'./vol,'linewidth',2);
scatter(LD,data(7,:)./vol,'linewidth',2);
scatter(LD,data(11,:)./vol,'linewidth',2);
legend('XX', 'YY','ZZ');
