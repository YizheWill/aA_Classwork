# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

#PROBLEM 1

def is_prime?(num)
  return false if num < 2
  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end
  return true
end

def largest_prime_factor(n)
  (2..n).reverse_each do |i|
    if is_prime?(i) && n % i == 0 
      return i
    end
  end
end


#PROBLEM 2

def unique_chars?(string)
    string.chars.all? { |char| string.count(char) == 1}
end

#PROBLEM 3

def dupe_indices(array)
  hash = Hash.new {|h,k| h[k] = []}

  array.each_with_index do |ele, i|
    if array.count(ele) > 1
      hash[ele] << i
    end
  end
  hash
end



#PROBLEM 4

def ana_array(array_1, array_2)
    hash_1 = Hash.new(0)
    hash_2 = Hash.new(0)

    array_1.each { |char| hash_1[char] += 1 }
    array_2.each { |char| hash_2[char] += 1 }

    return hash_1 == hash_2
end



