def bad_two_sum?(array, target)
  (0...array.length-1).each do |idx1|
    (idx1+1...array.length).each do |idx2|
      return true if array[idx1] + array[idx2] == target
    end
  end
  false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def ok_two_sum?(array, target)
  sorted = array.sort  
  count = 0
  sorted.each do |num|
    count += 1 if num.zero?
  end
  sorted.delete(0) if count = 1 && target = 0 
  sorted.each do |num|
    number_we_want = target - num
    res = b_search(array, number_we_want)
    return true if res
  end
  # sorted.each_with_index do |n, i|
    # res = b_search(array[0...i] + array[i+1..-1], target-n)
    # return true if res
  # end
  return false
end

def b_search(array, target)
  return nil if array.length == 0
  mid = array.length/2
  case array[mid] <=> target
  when 0
    return mid
  when 1
    b_search(array[0...mid], target)
  else
    search =  b_search(array[mid+1..-1], target)
    search && search + mid + 1
  end
end

# p ok_two_sum?([3,4,5,6, 1000], 1000)
# p ok_two_sum?([-1, 0, 1, 2,2,3], 0)

def two_sum_good?(array, target)
  hash = Hash.new(0)
  array.each do |num| 
    return true if hash[target-num] == 1
    hash[num] += 1
  end
  false
end

#O(n)
# p two_sum_good?([3,4,5,6, 1000], 1000)
# p two_sum_good?([ 0, 1, 2,2,3], 0)
