function assinaturas = minHashUsersByMovie(dicInfoByUser,numHash)
%MINHASH Summary of this function goes here
%   Detailed explanation goes here

%Nu = length(Set);   %Nº elementos do Set (users)
Nm = 1682; % number of movies;

%Nº linhas -> Nº users, Nº colunas -> Nº hash functions
assinaturas = Inf(Nm,numHash);
h = waitbar(0,'calculating movie signatures');

for i = 1:Nm
    usersByMovie = getUsersByMovie(dicInfoByUser,length(dicInfoByUser),i);
    Nu = size(usersByMovie)(1);
    waitbar(i/Nm,h);
    for j = 1:Nu

        key = num2str(usersByMovie{j,1});
        h_out = DJB31MA_multiple(key,127,numHash);
        assinaturas(i,:) = min(h_out,assinaturas(i,:));

    end
end
delete (h)

end
