function sigInterests = minHashInterests(dicInfoByUser,NumUsers,numHashFunc)
    sigInterests = Inf(NumUsers,numHashFunc);
    w = waitbar(0,'Calculating interests sigantures...');

    for n1 = 1:NumUsers
        waitbar(n1/NumUsers,w);
        interestsList = dicInfoByUser(n1,5:end);
        interests = [];
        % remove missing cells
        for int = 1:14
            if(length(interestsList{int})>1)
                interests = [interests interestsList(int)];
            end
        end
        Ninterests = length(interests);   % Nº interests do user

        for i = 1:Ninterests
            key = interests{i};
            h_out = DJB31MA_multiple(key,127,numHashFunc);
            sigInterests(n1,:) = min(h_out, sigInterests(n1,:));
        end
     end
    delete(w)
end

