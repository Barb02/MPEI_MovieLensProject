[Set,NumUsers,users] = loadData('u.data');
dic = readcell("users.txt","Delimiter",";");

% adicionar toda a informação em apenas um set
dic2 = cell(NumUsers,18);
dic2(:,1:3) = dic(:,1:3); 
dic2(:,4) = Set(:,1);
dic2(:,5:18) = dic(:,4:17);


