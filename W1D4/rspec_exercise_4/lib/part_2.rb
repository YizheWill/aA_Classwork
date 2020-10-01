def proper_factors(num)
  (1...num).select { |n| num % n == 0 }
end

def aliquot_sum(n)
  proper_factors(n).sum
end

def perfect_number?(n)
  n == aliquot_sum(n)
end

def ideal_numbers(num)
  return 6 if num == 1
  res = []
  i = 6
  counter = 0
  while counter < num
    if perfect_number?(i)
      res << i
      counter += 1
    end
    i += 1
  end
  return res
end
