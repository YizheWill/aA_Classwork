def partition(array, number)
  less = []
  more = []
  array.each do |el|
    if el < number
      less << el
    else
      more << el
    end
  end
  [less, more]
end

def merge(hash1, hash2)
  hash = Hash.new(0)
  hash1.each do |k, v|
    hash[k] = v
  end
  hash2.each do |k, v|
    hash[k] = v
  end
  hash
end

def replace_vowels(string)
  vowels = "aeiouAEIOU"

  string.each_char.with_index do |char, i|
    if vowels.include?(char)
      # string = string[0...i] + "*" + string[i + 1..-1]
      string[i] = "*"
    end
  end
  string
end

def censor(string, array)
  array = array.map(&:downcase)
  words = string.split(" ")
  res = []
  words.each do |word|
    if array.include?(word.downcase)
      res << replace_vowels(word)
    else
      res << word
    end
  end
  res.join(" ")
end


def power_of_two?(num)
    return true if num == 1
    return false if num % 2 != 0
    return power_of_two?(num/2)
end



