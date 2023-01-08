[moviesByUser,numUsers,users] = loadData('u.data');

dic = readcell("users.txt","Delimiter",";");
movieTitles = readcell("film_info.txt","Delimiter","\t");

% adicionar toda a informação de cada user em apenas um set
dicInfoByUser = cell(numUsers,18);
dicInfoByUser(:,1:3) = dic(:,1:3);
dicInfoByUser(:,4) = moviesByUser(:,1);
dicInfoByUser(:,5:18) = dic(:,4:17);
numHash = 200;

% opção 4
counting_bf = bloom_filter_initialize(16000);
bf_numHash = 6;

% criar e encher o counting_bf
h = waitbar(0,'Populating the counting bloom filter...');
for user_id = 1:numUsers
  waitbar(user_id/numUsers,h);
  movies = dicInfoByUser{user_id,4};
  for i = 1:length(movies)
    movie_id = movies(i,1);
    movie_rating = movies(i,2);
    if movie_rating > 3
      counting_bf = bloom_filter_increment(counting_bf, movie_id, bf_numHash);
    end
  end
end
delete(h)

% obter as assinaturas dos filtros
shingleSize = 3;
h = waitbar(0,'Separating titles into shingles...');
for i = 1:length(movieTitles)
  waitbar(i/length(movieTitles),h);
  title = movieTitles{i,1};
  for j = 1:(length(title)-shingleSize+1)
    shingle = lower(char(title(j:(j+shingleSize-1))));
    titles_shingle_set{i,j} = shingle;
  end
end
delete(h)
sigTitles = minHashTitles(titles_shingle_set,numHash);

% opção 2
sigMovies = minHashUsersByMovie(dicInfoByUser,numHash);

% opção 3
sigInterests = minHashInterests(dicInfoByUser,numUsers,numHash);

save("data.mat","users","numUsers","dicInfoByUser","shingleSize","numHash","counting_bf","bf_numHash","sigTitles","sigMovies","sigInterests")




