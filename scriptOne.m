[Set,NumUsers,users] = loadData('u.data');
dic = readcell("users.txt","Delimiter",";");

% adicionar toda a informação em apenas um set
dicInfoByUser = cell(NumUsers,18);
dicInfoByUser(:,1:3) = dic(:,1:3); 
dicInfoByUser(:,4) = Set(:,1);
dicInfoByUser(:,5:18) = dic(:,4:17);


