require "byebug"

def range(num1, num2)
  if num2 == num1
    return [num1]
  end
  r = []
  r = range(num1, num2 - 1) + [num2]
end

def exp(base, e)
  return 1 if e == 0
  base * exp(base, e - 1)
end

# p exp(2, 5)

def deep_dup(array)
  if array == []
    return array.dup
  end
  res = []
  if array.length == 1 && !array.first.is_a?(Array)
    return [array.first.dup]
  else
    array.each do |ele|
      if (ele.is_a?(Array) && check_ele(ele)) || !ele.is_a?(Array)
        res << ele.dup
      elsif ele.is_a?(Array)
        res += deep_dup(ele)
      end
    end
  end
  res
end

def check_ele(arr)
  return arr.all? { |ele| !ele.is_a?(Array) }
end

arr = ["a", "b", "c", "d", [1, 2, 3]]
a = [[1, 2, 3], [2, 3, 4]]

# p deep_dup(arr)

def fibonacci(num)
  return nil if num < 1
  return 1 if num == 1
  return 1 if num == 2
  fibonacci(num - 1) + fibonacci(num - 2)
end

# 1, 1, 2, 3, 5, 8
# p fibonacci(3)
# p fibonacci(5)
# p fibonacci(6)

def bsearch(arr, target)
  return nil if arr == []
  len = arr.length
  mid = len / 2
  return mid if arr[mid] == target
  left = arr[0...mid]
  right = arr[mid + 1..-1]
  if target < arr[mid]
    bsearch(left, target)
  else
    n = bsearch(right, target)
    if !n
      return nil
    end
    mid + 1 + n
  end
end

def merge_sort(array)
  return array if array.length <= 1
  mid_point = array.length / 2
  left = array[0...mid_point]
  right = array[mid_point..-1]
  a = merge_sort(left)
  b = merge_sort(right)
  merge(a, b)
end

def merge(left, right)
  res = []
  while left.length > 0 && right.length > 0
    if left.first > right.first
      res << right.shift
    else
      res << left.shift
    end
  end
  if left.length == 0
    res.concat(right)
  else
    res.concat(left)
  end
  return res
end

# p merge_sort((0..20).to_a.shuffle)

def subsets(array)
  return [] if array.empty?
  return [[], array] if array.length == 1
  last = array.pop
  prev = subsets(array[0..-1])
  after_map = prev.map do |subarr|
    subarr + [last]
  end
  prev.concat(after_map)
end

def permutations(array)
  return [array] if array.length <= 1
  last = array.pop # 2
  prev = permutations(array) # [1]
  #expecting [[1,2],[2,1]]
  res = []
  prev.each do |ele|
    res += combinations(ele, last)
  end
  res.sort
end

def combinations(array, last)
  res = []
  (array.length - 1).downto(0).each do |i|
    res << array[0..i] + [last] + array[i + 1..-1]
  end
  res << ([last] + array)
  res
end

# p combinations([1, 2], 3)
# p permutations([1])
# p permutations([1, 2])
# p permutations([1, 2, 3])

def greedy_make_change(num, array)
  if num == array.first
    return [array.first]
  end
  if num < array.last
    return []
  end
  if num == 0
    return []
  end

  res = []

  if num > array.first
    res << array.first
    num -= array.first
    res += greedy_make_change(num, array)
  else
    res += greedy_make_change(num, array[1..-1])
  end
  res
end

# p greedy_make_change(24, [10, 7, 1])

def make_better_change(num, array)
  return [array.first] if num == array.first
  return [] if num < array.last
  return [] if num == 0
  res = coin_combos(num, array)
  p res
  res.sort_by(&:length).first
end

def coin_combos(num, array)
  return [array.first] if num == array.first
  return [] if num < array.last
  return [] if num == 0
  bank = []
  array.each_with_index do |coin, idx|
    # some_variable = [coin]
    if coin > num
      next
    else
      possi = coin_combos(num - coin, array[idx..-1])
      p possi
      bank << ([coin] + possi)

      # =>second round coin_combos(7, [10, 7, 1])
      # 7 compare 10 X
      # 7 compare 7 works => [7]
      # 7 compare 1

      # sleep 2
      # p some_variable
    end
    if num < array.last
      return false
    end
  end
  bank
end

p make_better_change(4, [2, 1])

# class Node
#   def initialize(parent, value)
#     @parent = parent
#     @value = value
#     @children = []
#   end

#   def add_child(node)
#     @children << node
#   end
# end
