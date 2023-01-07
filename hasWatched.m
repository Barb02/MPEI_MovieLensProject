function result = hasWatched (dic, user_id, movies)
  result = sum(ismember(movies,dic(user_id,4){1}(:,1))) > 0;
endfunction
