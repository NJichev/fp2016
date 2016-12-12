def join(arr, delim)
  arr.reduce("", +) { |acc, x| acc + delim + x }
end

str = %w(a b c)
p join(str, " ")
