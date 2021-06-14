load ('M.mat');
load ('D_data.mat');
blocchi=zeros(456,1);
v=0;
for r=1:456
    if (M(r,2)==0 && M(r,3)==0) && M(r,4)==0
        v=v+1;
       blocchi(v,1)=M(r,6);
    end
end
for r=1:v
   i=D_data(:,1)==blocchi(r,1);
   w=D_data(i,:);
   plot(w(1,:));
   hold on;
end
hold off;

% g=1;
% w=blocchi(g,1);
% for s=1:456
%     if D_data(s,1)==w
%         plot(D_data(s,3:end));
%         w=blocchi(g+1,1);
%     end
%     hold on;
% end
