function value = bloom_filter_get_element (filter, element, k)
  key = num2str(element);
  value = inf;
  for i = 1:k
    key = [key int2str(i)];
    h = mod(DJB31MA(key, k),length(filter)) + 1;
    value = min(value,filter(h));
  end
end
