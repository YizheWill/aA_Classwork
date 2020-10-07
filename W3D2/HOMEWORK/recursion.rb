def sum(n)
  return nil if n < 0
  if n <=1
    return n 
  end
  n + sum(n-1)
end


def add_number(nums_array)
  if nums_array.empty?
    return nil 
  elsif nums_array.length == 1
    return nums_array.first
  else
    return add_number(nums_array[0..-2]) + nums_array.last
  end
end


def gamma_fnc(num)
  return nil if num == 0
  return 1 if num == 1
  return 1 if num == 2
  return 2 if num == 3
  return (num-1)*gamma_fnc(num-1)
end

def ice_cream_shop(flavors, favorite)
  return false if flavors.empty? || favorite.nil?
  dup_flavors = flavors
  return true if dup_flavors.pop == favorite
  ice_cream_shop(dup_flavors, favorite)
end

def reverse(string)
  return string if string.length <= 1
  return reverse(string[1..-1]) + string[0]
end
