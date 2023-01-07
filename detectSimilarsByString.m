function SimilarTitles = detectSimilarsByString(sigString, sigTitles, numHash)
    k= 1;
    n_titles = length(sigTitles);
    for title = 1:n_titles
        distancia = sum(sigString ~= sigTitles(title,:))/numHash;
        SimilarTitles(k,:) = [title distancia];
        k= k+1;
    end
end
