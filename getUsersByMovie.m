function usersByMovie = getUsersByMovie(dicInfoByUser,NumUsers,filmId)    
    usersByMovie = {};
    Set = dicInfoByUser(:,4);
    for user = 1:NumUsers
        movies = Set{user,1};
        if find(movies(:,1) == filmId) > 0
            usersByMovie(end+1,:) = {user dicInfoByUser{user,2} dicInfoByUser{user,3}};
        end
    end
end

