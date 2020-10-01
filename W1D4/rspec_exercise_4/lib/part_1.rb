def my_select(array, &prc)
  res = []
  array.each do |el|
    res << el if prc.call(el)
  end
  res
end

def my_reject(array, &prc)
  res = []
  array.each do |el|
    res << el if !prc.call(el)
  end
  res
end

def my_each(array, &prc)
  i = 0
  while (i < array.length - 1)
    prc.call(array[i])
    i += 1
  end
end

def my_one?(array, &prc)
  counter = 0
  array.each do |el|
    counter += 1 if prc.call(el)
    return false if counter > 1
  end
  return counter == 0 ? false : true
end

def hash_select(hash, &prc)
  res = {}
  hash.each do |k, v|
    res[k] = v if prc.call(k, v)
  end
  res
end

def xor_select(array, prc1, prc2)
  array.select { |e| prc1.call(e) != prc2.call(e) }
end

def proc_count(value, array)
  array.count { |prc| prc.call(value) }
end
