function result = hasWatched (dic, user_id, movies)

  user_movies = dic(user_id,4);
  user_movies = user_movies{1};
  ids = user_movies(:,1);
  result = sum(ismember(movies,ids)) > 0;

end
