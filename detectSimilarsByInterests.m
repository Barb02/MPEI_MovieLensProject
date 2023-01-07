function similarUsers = detectSimilarsByInterests(userID,signatures,numHashFunc,users,usersAlreadyWatched)
% This function only compares one user to the rest that didnt evaluate the
% movie yet. Must be inside a for loop to test out all users.
    threshold = 0.9; % limiar de decisão
    usersRecommended = setdiff(users,usersAlreadyWatched)';
    c = 1;

    for u1=usersRecommended
        distancia = 1 - sum(signatures(u1,:)==signatures(userID,:))/numHashFunc;
        if (u1 ~= userID) && (distancia < threshold)
            similarUsers(c,:) = u1;
            c = c+1;
        end
    end
end
