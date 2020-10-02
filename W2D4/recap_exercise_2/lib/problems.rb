# Write a method, least_common_multiple, that takes in two numbers and returns the smallest number that is a mutiple
# of both of the given numbers
def least_common_multiple(num_1, num_2)
  (1..num_1 * num_2).each do |n|
    return n if n % num_1 == 0 && n % num_2 == 0
  end
end

# Write a method, most_frequent_bigram, that takes in a string and returns the two adjacent letters that appear the
# most in the string.
class String
  def substrings(length = nil)
    arr = []
    self.each_char.with_index do |c, i|
      self.each_char.with_index do |char, j|
        if (j >= i)
          arr << self[i..j]
        end
      end
    end
    if length
      arr.select { |el| el.length == length }
    else
      arr
    end
  end
end

def most_frequent_bigram(str)
  hash = Hash.new(0)
  substrings = str.substrings(2)
  substrings.each do |el|
    hash[el] += 1
  end
  hash.find { |k, v| v == hash.values.max }[0]
end

class Hash
  # Write a method, Hash#inverse, that returns a new hash where the key-value pairs are swapped
  def inverse
    hash = {}
    self.each do |k, v|
      hash[v] = k
    end
    hash
  end
end

class Array
  # Write a method, Array#pair_sum_count, that takes in a target number returns the number of pairs of elements that sum to the given target
  def pair_sum_count(num)
    result = 0
    self.each_with_index do |ele, i|
      self.each_with_index do |el, j|
        if j < i && ele + el == num
          result += 1
        end
      end
    end
    result
  end

  # Write a method, Array#bubble_sort, that takes in an optional proc argument.
  # When given a proc, the method should sort the array according to the proc.
  # When no proc is given, the method should sort the array in increasing order.
  #
  # Sorting algorithms like bubble_sort, commonly accept a block. That block accepts
  # two parameters, which represents the two elements in the array being compared.
  # If the block returns 1, it means that the second element passed to the block
  # should go before the first (i.e. switch the elements). If the block returns -1,
  # it means the first element passed to the block should go before the second
  # (i.e. do not switch them). If the block returns 0 it implies that
  # it does not matter which element goes first (i.e. do nothing).
  #
  # This should remind you of the spaceship operator! Convenient :)
  def bubble_sort(&prc)
    sorted = false
    prc ||= Proc.new(&:<=>)
    while !sorted
      sorted = true
      self.each_with_index do |ele, i|
        if i < self.length - 1 && prc.call(ele, self[i + 1]) == 1
          self[i], self[i + 1] = self[i + 1], self[i]
          sorted = false
        end
      end
    end
    self
  end
end
