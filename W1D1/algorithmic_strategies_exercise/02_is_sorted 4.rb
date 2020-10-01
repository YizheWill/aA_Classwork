# Write a method, is_sorted(arr), that accepts an array of numbers as an arg.
# The method should return true if the elements are in increasing order, false otherwise.
# Do not use the built-in Array#sort in your solution :)

def is_sorted(nums)
  # (0...nums.length - 1).each do |i|
  #   if nums[i + 1] < nums[i]
  #     return false
  #   end
  # end
  # true
#  !(0...nums.length - 1).any? {|i| nums[i] > nums[i + 1]}
 (0...nums.length - 1).all? {|i| nums[i] <= nums[i + 1]}
end

p is_sorted([1, 4, 10, 13, 15])       # => true
p is_sorted([1, 4, 10, 10, 13, 15])   # => true
p is_sorted([1, 2, 5, 3, 4 ])         # => false
