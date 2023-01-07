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
            similarUsers = cell(numUsersByMovie,1);
            for id = 1:numUsersByMovie
                similarUsers{id} = detectSimilarsByInterests(id,sigInterests,200,users,usersByMovieIds);
            end

            user_appear_count = zeros(NumUsers,1);
            user_appear_count(:,2) = 1:NumUsers;
            for id=1:NumUsers
                for j=1:numUsersByMovie
                    if ismember(id,similarUsers{j})
                        user_appear_count(id,1) = user_appear_count(id,1) + 1; 
                    end    
                end
            end 
            user_appear_count = sortrows(user_appear_count,1,"descend");
            fprintf("We sugest the following users to evaluate this movie, based on common interests: \n");
            fprintf("ID: %d; Full Name: %s %s\n", user_appear_count(1,2), dicInfoByUser{user_appear_count(1,2),2}, dicInfoByUser{user_appear_count(1,2),3});
            fprintf("ID: %d; Full Name: %s %s\n", user_appear_count(2,2), dicInfoByUser{user_appear_count(2,2),2}, dicInfoByUser{user_appear_count(2,2),3});
            
        case 4
       
        case 5
            break
    end
end
