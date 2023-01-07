function similarUsers = detectSimilarsByInterests(signatures,numHashFunc,NumUsers,users,usersByMovie)
    threshold = 0.9; % limiar de decisão
    % Array para guardar pares similares (user1, user2, distância)
    similarUsers = zeros(length(usersByMovie),3);
    c = 1;
    
    for n1=1:NumUsers
        for n2= n1+1:NumUsers
            distancia = 1 - sum(signatures(n1,:)==signatures(n2,:))/numHashFunc;
            if distancia < threshold
                % user n1 já avaliou o filme e n2 não
                if (sum(usersByMovie == n1) > 0) && (sum(usersByMovie == n2) == 0)
                    similarUsers(c,:) = [users(n1) users(n2) distancia];
                    c = c+1;
                % user n2 já avaliou o filme e n1 não
                elseif (sum(usersByMovie == n2) > 0) && (sum(usersByMovie == n1) == 0)
                    similarUsers(c,:) = [users(n2) users(n1) distancia];
                    c = c+1;
                end
            end
        end
    end
