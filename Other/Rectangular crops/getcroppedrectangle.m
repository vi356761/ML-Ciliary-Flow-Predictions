% Get the velocities from the cropped area:
function [row1, row2, col1, col2, xin, yin, uin, vin,vrms] = getcroppedrectangle(x_s,y_s,u,v,vm)
figure;
quiverC2D(x_s,y_s,u,v,'scale',5,'LineWidth', 2,'MaxHeadSize', 2); %2
set(gcf, 'Position', get(0, 'Screensize'));
hold on;
%h = drawrectangle('Position',[20 20 249 249]);
%h = images.roi.Rectangle(gca,'Position',[20,20,349,349],'StripeColor','r');
h = drawrectangle();
%p = h.Position;
p = customWait(h);
%..............................Get the columns.............................
%Col1
sub = abs(x_s - p(1,1));
sub_min = min(sub,[],'all');
ANS=find(sub==sub_min);
%xx_s = x_s(ANS);
[~, col1] = ind2sub(size(x_s),ANS(1,1));
%Col2
sub = abs(x_s - (p(1,1)+p(1,3)));
sub_min = min(sub,[],'all');
ANS=find(sub==sub_min);
%xx_s = x_s(ANS);
[~, col2] = ind2sub(size(x_s),ANS(1,1));
%..............................Get the rows................................
%Row1
sub = abs(y_s - p(1,2));
sub_min = min(sub,[],'all');
ANS=find(sub==sub_min);
%yy_s = y_s(ANS);
[row1, ~] = ind2sub(size(y_s),ANS(1,1));
%Row2
sub = abs(y_s - (p(1,2)+p(1,4)));
sub_min = min(sub,[],'all');
ANS=find(sub==sub_min);
%yy_s = y_s(ANS);
[row2, ~] = ind2sub(size(y_s),ANS(1,1));
%...............................Now crop the matrix........................
xin = x_s(row2:row1,col1:col2);
yin = y_s(row2:row1,col1:col2);
uin = u(row2:row1,col1:col2);
vin = v(row2:row1,col1:col2);
vrms=  vm(row2:row1,col1:col2);
%..........................................................................
% xin = x_s(row1:row2,col2:col1);
% yin = y_s(row1:row2,col2:col1);
% uin = u(row1:row2,col2:col1);
% vin = v(row1:row2,col2:col1);
% vrms= vm(row1:row2,col2:col1);
end