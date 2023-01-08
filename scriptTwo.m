filmId = 0;

while filmId < 1 || filmId > 1682
    filmId = input("Insert Film ID (1 to 1682): ");
    if filmId < 1 || filmId > 1682
        fprintf("Error! ID must be a number from 1 to 1682\n");
    end
end

load("data.mat");

while true
    choice = menu("Choose one of the following:",...
        "1 - Users that evaluated current movie",...
        "2 - Suggestion of users to evaluate movie",...
        "3 - Suggestion of users based on common interests",...
        "4 - Movies feedback based on popularity",...
        "5 - Exit");
    usersByMovie = getUsersByMovie(dicInfoByUser,numUsers,filmId);
    numUsersByMovie = size(usersByMovie);
    numUsersByMovie = numUsersByMovie(1);
    switch choice
        case 1
            fprintf("This movie was evaluated by:\n")
            for u = 1:numUsersByMovie
                fprintf("User ID: %d Full Name: %s %s\n", usersByMovie{u,1}, usersByMovie{u,2}, usersByMovie{u,3});
            end
        case 2

            similarMovies = sortrows(detectSimilarMoviesByUsers(sigMovies,0.9,200,filmId),3);
            s = size(similarMovies);
            s = s(1);
            if s < 2
              printf("there are no movies similar to this one\n")
              continue
            else
              mostSimilar = similarMovies(1:2,2);
            end
            visited = zeros(1,numUsers);
            printf("We suggest the following users to evaluate this movie:\n\n")
            for i_movie = 1:length(mostSimilar)
               movie = mostSimilar(i_movie);
               m_users = getUsersByMovie(dicInfoByUser,numUsers,movie);
               for i_user = 1:length(m_users(:,1))
                 user = m_users{i_user,1};
                 if hasWatched(dicInfoByUser,user,mostSimilar) && ~hasWatched(dicInfoByUser,user,filmId) && ~visited(user)
                    printf("User ID: %d Full Name: %s %s\n", user, m_users{i_user, 2}, m_users{i_user, 3})
                 endif
                 visited(user) = 1;
               endfor
            endfor

        case 3
            usersByMovieIds = zeros(numUsersByMovie,1);
            for u = 1:numUsersByMovie
                usersByMovieIds(u,1) = usersByMovie{u,1};
            end
            similarUsers = cell(numUsersByMovie,1);
            for id = 1:numUsersByMovie
                similarUsers{id} = detectSimilarsByInterests(id,sigInterests,200,users,usersByMovieIds);
            end

            user_appear_count = zeros(numUsers,1);
            user_appear_count(:,2) = 1:numUsers;
            for id=1:numUsers
                for j=1:numUsersByMovie
                    if ismember(id,similarUsers{j})
                        user_appear_count(id,1) = user_appear_count(id,1) + 1;
                    end
                end
            end

            %matlab
            %user_appear_count = sortrows(user_appear_count,1,"descend");
            %octave
            user_appear_count = sortrows(user_appear_count,-1);

            fprintf("\nWe sugest the following users to evaluate this movie, based on common interests: \n");
            fprintf("ID: %d; Full Name: %s %s\n", user_appear_count(1,2), dicInfoByUser{user_appear_count(1,2),2}, dicInfoByUser{user_appear_count(1,2),3});
            fprintf("ID: %d; Full Name: %s %s\n", user_appear_count(2,2), dicInfoByUser{user_appear_count(2,2),2}, dicInfoByUser{user_appear_count(2,2),3});


        case 4

            movie_name = input("insira o nome (ou parte do nome) de um filme: ", 's');

            for i = 1:(length(movie_name)-shingleSize+1)

                shingle = lower(char(movie_name(i:(i+shingleSize-1))));
                shingle_set{1,i} = shingle;

            end

            sigChosenTitle = minHashTitles(shingle_set,numHash);
            similarTitles = sortrows(detectSimilarsByString(sigChosenTitle,sigTitles,numHash),2);

            for i = 1:3
              title_id = similarTitles(i,1);
              times_evaluated = bloom_filter_get_element(counting_bf,title_id,bf_numHash);
              fprintf("ID: %d\nMovie Title: %s\nAmount of scores above a 3: %d \n\n", title_id, movieTitles{title_id},times_evaluated);
            end

            clear shingle_set

        case 5
            break
    end
end
