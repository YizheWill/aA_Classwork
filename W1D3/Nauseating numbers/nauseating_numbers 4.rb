def strange_sums(arr)
  index = []
  counter = 0
  arr.each_with_index do |num, idx|
    arr.each_with_index do |n, i|
      if i > idx && arr[i] == -arr[idx] && !index.include?(i) && !index.include?(idx)
        index.push(i, idx)
        counter += 1
      end
    end
  end
  return counter
end

def pair_product(arr, product)
  arr.each_with_index do |num, idx|
    arr.each_with_index do |n, i|
      return true if i > idx && arr[i] * arr[idx] == product
    end
  end
  false
end

def rampant_repeats(str, hash)
  str.chars.inject("") do |acc, el|
    if hash[el]
      acc += (el * hash[el])
    else
      acc += el
    end
  end
end

def perfect_square(num)
  (0..num).each do |x|
    return true if x * x == num
  end
  return false
end

def anti_prime?(num)
  divisor = count_divisors(num)
  (1...num).none? { |n| count_divisors(n) >= divisor }
end

def count_divisors(num)
  (1..num).count { |divisor| num % divisor == 0 }
end

def matrix_addition(m1, m2)
  res = Array.new(m1.length) { Array.new(m1.first.length) }
  m1.each_with_index do |arr1, index|
    arr1.each_with_index do |n, i|
      res[index][i] = m1[index][i] + m2[index][i]
    end
  end
  return res
end

def mutual_factors(*nums)
  min = nums.min
  res = []
  (1..min).select do |div|
    nums.all? { |num| num % div == 0 }
  end
end

def tribonacci_number(num)
  fib = [1, 1, 2]
  i = 3
  while (i <= num)
    fib[i] = fib[i - 1] + fib[i - 2] + fib[i - 3]
    i += 1
  end
  return fib[num - 1]
end

def matrix_addition_reloaded(*arr)
  count = 0
  while count < arr.length - 1
    return nil if arr[count].length != arr[count + 1].length
    count += 1
  end
  res = Array.new(arr.first.length) { Array.new(arr.first.first.length) }
  arr[0].each_with_index do |arr1, index|
    arr1.each_with_index do |n, i|
      res[index][i] = arr.inject(0) { |acc, ele| acc += ele[index][i] }
    end
  end
  return res
end

def squarocol?(arr)
  hor = arr.each_with_index.any? do |sub, i|
    (0...sub.length - 1).all? do |idx|
      arr[i][idx] == arr[i][idx + 1]
    end
  end

  ver = arr.each_with_index.any? do |sub, i|
    (0...sub.length - 1).all? do |idx|
      arr[idx][i] == arr[idx + 1][i]
    end
  end
  return hor || ver
end

def squaragonal?(array)
  len = array.length
  upward = (0...len - 1).all? do |i|
    array[i][-i - 1] == array[i + 1][-(i + 1) - 1]
  end
  downward = (0...len - 1).all? do |i|
    array[i][i] == array[i + 1][i + 1]
  end
  upward || downward
end

def pascals_triangle(param)
  return [[1]] if param == 1
  return [[1], [1, 1]] if param == 2
  result_arr = []
  to_tinker = pascals_triangle(param - 1)[-1]
  to_tinker.each_with_index do |el, i|
    if (i == 0)
      result_arr << 1
    else
      result_arr << el + to_tinker[i - 1]
    end
  end
  result_arr << 1
  return pascals_triangle(param - 1) << result_arr
end

def is_prime?(num)
  num > 2 && (2...num).none? { |n| num % n == 0 }
end

def is_mersenne?(num)
  p2 = 1
  while p2 < num
    p2 *= 2
    return true if p2 - 1 == num && is_prime?(num)
  end
  return false
end

def mersenne_prime(num)
  counter = 0
  res = 2
  while counter < num
    res += 1
    if is_mersenne?(res) && is_prime?(res)
      counter += 1
    end
  end
  return res
end

def triangular_word?(str)
  alphabet = ("a".."z").to_a
  num = str.chars.inject(0) { |ac, ch| ac += alphabet.index(ch) + 1 }
  return is_triangular(num)
end

def is_triangular(num)
  i = 0
  while i < num
    if (i * (i + 1)) / 2 == num
      return true
    end
    i += 1
  end
  return false
end

def no_consecutive(array)
  (0...array.length - 1).each do |idx|
    return idx if array[idx] == array[idx + 1] + 1 || array[idx] == array[idx + 1] - 1
  end
  return false
end

def consecutive_collapse(array)
  while res = no_consecutive(array)
    array.delete_at(res)
    array.delete_at(res)
  end
  return array
end

p consecutive_collapse([3, 4, 1])                     # [1]
p consecutive_collapse([1, 4, 3, 7])                  # [1, 7]
p consecutive_collapse([9, 8, 2])                     # [2]
p consecutive_collapse([9, 8, 4, 5, 6])               # [6]
p consecutive_collapse([1, 9, 8, 6, 4, 5, 7, 9, 2])   # [1, 9, 2]
p consecutive_collapse([3, 5, 6, 2, 1])               # [1]
p consecutive_collapse([5, 7, 9, 9])                  # [5, 7, 9, 9]
p consecutive_collapse([13, 11, 12, 12])              # []

def is_prime?(num)
  num > 1 && (2...num).none? { |n| num % n == 0 }
end

def nth_prime(num, i)
  j = 0
  if (i < 0)
    i = -i
    while (j < i && num > 1)
      num -= 1
      if is_prime?(num)
        j += 1
      end
      if num == 1
        return nil
      end
    end
    return num
  end
  while (j < i)
    num += 1
    j += 1 if is_prime?(num)
  end
  return num
end

def pretentious_primes(arr, num)
  arr.map { |n| nth_prime(n, num) }
end
