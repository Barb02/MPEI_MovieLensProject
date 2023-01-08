function filter = bloom_filter_increment (filter, element, k)
  key = num2str(element);
  for i = 1:k
    key = [key int2str(i)];
    h = mod(DJB31MA(key, k),length(filter)) + 1;
    filter(h) = filter(h) + 1;
  end
end
