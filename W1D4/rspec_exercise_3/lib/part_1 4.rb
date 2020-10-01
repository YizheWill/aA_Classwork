def is_prime?(num)
  return true if num == 2
  num > 2 && (2...num).none? { |n| num % n == 0 }
end

def nth_prime(n)
  counter = 0
  start = 1
  while (counter < n)
    start += 1
    counter += 1 if is_prime?(start)
  end
  return start
end

def prime_range(small, large)
  return [] if small < 0 || small > large
  (small..large).select { |n| is_prime?(n) }
end
