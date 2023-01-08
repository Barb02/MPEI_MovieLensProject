function signatures = minHashUsersByMovie(dicInfoByUser,numHash)

  Nm = 1682; % number of movies;
  signatures = Inf(Nm,numHash);

  h = waitbar(0,'Calculating movie signatures...');

  for i = 1:Nm
      usersByMovie = getUsersByMovie(dicInfoByUser,length(dicInfoByUser),i);
      numUsersByMovie = size(usersByMovie);
      Nu = numUsersByMovie(1);
      waitbar(i/Nm,h);
      for j = 1:Nu

          key = num2str(usersByMovie{j,1});
          h_out = DJB31MA_multiple(key,19,numHash);
          signatures(i,:) = min(h_out,signatures(i,:));

      end
  end
  delete (h)

end
