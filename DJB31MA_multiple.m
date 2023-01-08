function h_out = DJB31MA_multiple( chave, seed, K)
  len = length(chave);
  chave = double(chave);
  h = seed;
  for i=1:len
    h = mod(31 * h + chave(i), 2^32 -1) ;
  end

  h_out = zeros(1,K);
  for j=1:K
    h = mod(31 * h + j, 2^32 -1);
    h_out(j)= h;
  end
end
