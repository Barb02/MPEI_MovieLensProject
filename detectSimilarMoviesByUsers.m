function SimilarMovies = detectSimilarMoviesByUsers(assinaturas,threshold,numHash,movie)

  movies = [1:1682];
  Nm = length(movies);
  SimilarMovies = zeros(1,3);
  k= 1;

  m1 = movie;
  for m2= m1+1:Nm
    distancia = sum(assinaturas(m1,:) ~= assinaturas(m2,:))/numHash;
    if  distancia < threshold
      SimilarMovies(k,:)= [m1 m2 distancia];
      k= k+1;
    end
  end

end

