filmId = 0;

while filmId < 1 || filmId > 1682
    filmId = input("Insert Film ID (1 to 1682): ");
    if filmId < 1 || filmId > 1682 
        fprintf("Error! ID must be a number from 1 to 1682\n");
    end
end

while true
    choice = menu("Choose one of the following:",...
        "1 - Users that evaluated current movie",...
        "2 - Suggestion of users to evaluate movie",...
        "3 - Suggestion of users based on common interests",...
        "4 - Movies feedback based on popularity",...
        "5 - Exit");
    usersByMovie = getUsersByMovie(dicInfoByUser,NumUsers,filmId);
    numUsersByMovie = length(usersByMovie);
    switch choice
        case 1
            fprintf("This movie was evaluated by:\n")
            for u = 1:numUsersByMovie
                fprintf("User ID: %d Full Name: %s %s\n", usersByMovie{u,1}, usersByMovie{u,2}, usersByMovie{u,3});
            end
        case 2
            
        case 3
            load("sigInterests.mat");
            usersByMovieIds = zeros(numUsersByMovie,1);
            for u = 1:numUsersByMovie
                usersByMovieIds(u,1) = usersByMovie{u,1};
            end
            similarUsers = detectSimilarsByInterests(sigInterests,200,NumUsers,users,usersByMovieIds)
        case 4
       
        case 5
            break
    end
end
