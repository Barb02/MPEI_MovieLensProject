function h_out= DJB31MA_multiple( chave, seed, K)
% implementação da hash function DJB31MA com base no algoritmo obtido
% no resumo 2014(PJF) que está em C
%
%  chave    array de caracteres com a chave
%  seed     semente que permite obter vários hash codes para a mesma chave
%
%  h        hashcode devolvido
len= length(chave);
chave= double(chave);
h= seed;
for i=1:len
    h = mod(31 * h + chave(i), 2^32 -1) ;
end

%adicionado
h_out = zeros(1,K);
for j=1:K
    h = mod(31 * h + j, 2^32 -1);
    h_out(j)= h;
end
end
