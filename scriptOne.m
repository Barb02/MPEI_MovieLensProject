[moviesByUserArr,NumUsers,users] = loadData('u.data');

% ON MATLAB USE THIS
dic = readcell("users.txt","Delimiter",";");

% ON OCTAVE USE THIS
%dic = csv2cell("users2.txt",';');
%dic = dic(2:944,:);

% adicionar toda a informação de cada user em apenas um set
dicInfoByUser = cell(NumUsers,18);
dicInfoByUser(:,1:3) = dic(:,1:3);
dicInfoByUser(:,4) = moviesByUserArr(:,1);
dicInfoByUser(:,5:18) = dic(:,4:17);

numHashFunc = 200;

%% opção 2
sigMovies = minHashUsersByMovie(dicInfoByUser,numHashFunc);
save("sigMovies.mat","sigMovies");

%% opção 3
sigInterests = minHashInterests(dicInfoByUser,NumUsers,numHashFunc);
save("sigInterests.mat","sigInterests");
