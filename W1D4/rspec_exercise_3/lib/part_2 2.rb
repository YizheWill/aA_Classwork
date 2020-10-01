def element_count(array)
  array.inject(Hash.new(0)) { |a, e| a[e] += 1; a }
end


def char_replace!(string, hash)
  (0...string.length).each do |i|
    string[i] = hash[string[i]] if hash[string[i]]
  end
  string
end

def product_inject(array)
  array.inject(:*)
end
