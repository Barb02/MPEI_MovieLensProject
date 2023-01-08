function signatures = minHashTitles(shingles,numHash)

  [n_rows,n_col]= size(shingles);
  signatures = inf(n_rows,numHash);

  h = waitbar(0,'Calculating title signatures...');
  for i = 1:n_rows
    waitbar(i/n_rows,h);
    for j = 1:n_col

      key = shingles{i,j};
      if isempty(key)
        break
      end
      h_out = DJB31MA_multiple(key,127,numHash);
      signatures(i,:) = min(h_out,signatures(i,:));

    end
  end

  delete(h);
end

