function SimilarMovies = detectSimilarMoviesByUsers(assinaturas,threshold,numHash,movie)
  %OBTERSIMILARESHASH Summary of this function goes here
  %   Detailed explanation goes here

  movies = [1:1682];
  Nm = length(movies);
  % Array para guardar pares similares (user1, user2, distancia)
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

