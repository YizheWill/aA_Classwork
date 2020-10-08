def quick_sort(array)
  return array if array.length <= 1
  pivot = array.first
  left = array[1..-1].select { |e| e <= pivot }
  right = array[1..-1] - left
  quick_sort(left) + [pivot] + quick_sort(right)
end

def merge_sort(array)
  p array
  return array if array.length <= 1
  left = array[0...array.length / 2]
  right = array[array.length / 2..-1]
  sleep 1
  merge(merge_sort(left), merge_sort(right))
end

def merge(array1, array2)
  p "merging array1 #{array1}, array2 #{array2}"
  res = []
  while !array1.empty? && !array2.empty?
    res << (array1.first < array2.first ? array1.shift : array2.shift)
  end
  array1.empty? ? res.concat(array2) : res.concat(array1)
  res
end

def quick_sort(array, i = nil, j = nil)
  i ||= 0
  j ||= (array.length - 1)
  return if array.length <= 1
  s = i
  e = j
  pivot = array[j]
  j -= 1
  while i < j
    p "new round array is #{array}"
    while array[i] <= pivot && i < j
      p "i is #{i}, incrementing i, i will be #{i + 1}"
      i += 1
    end
    while array[j] > pivot && j > 0 && j > i
      p "j is #{j}, incrementing j, j will be #{j}"
      j -= 1
    end
    p "outside of the loop i is #{i}, j is #{j}"
    if i < j
      p "now array is #{array} and i < j, changing order"
      array[i], array[j] = array[j], array[i]
      i += 1
      j -= 1
      if i > j
        array[i] 
      p "after alteration, array is #{array}, i is #{i}, j is #{j}"
    elsif i >= j
      p "i is #{i}, j is #{j}, i == j, start the last step"
      if array[j] < pivot
        p "pivot too big, not moving it"
        quick_sort(array, s, e - 1)
      else
        p "i is #{i}, j is #{j}, array now is #{array}"
        array[j], array[e] = array[e], array[j]
        p "after this, array is #{array} and i is #{i}, j is #{j}"

        quick_sort(array, 0, j - 1)
        quick_sort(array, j + 1, e)
      end
    end
  end
  return array
end

arr = (0..10).to_a.shuffle
p arr
p quick_sort(arr)

# p quick_sort((1..10).to_a.shuffle)
# p merge_sort((1..9).to_a.shuffle)
