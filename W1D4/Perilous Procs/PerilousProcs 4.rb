def some?(array, &blk)
  array.any?(&blk)
end

def exactly?(array, n, &blk)
  array.count(&blk) == n
end

def filter_out(array, &blk)
  res = []
  array.each { |el| blk.call(el) ? el : res << el }
  res
end

def at_least?(array, num, &blk)
  array.count(&blk) >= num
end

def every?(array, &blk)
  array.all?(&blk)
end

def at_most?(array, num, &blk)
  array.count(&blk) <= num
end

def first_index(array, &blk)
  array.each_with_index { |e, i| return i if blk.call e }
  return nil
end

def xnor_select(array, prc1, prc2)
  array.select { |e| prc1.call(e) == prc2.call(e) }
end

def filter_out!(array, &blk)
  i = 0
  blk.call(array[i]) ? array.delete_at(i) : i += 1 until i == array.length
end

def multi_map(array, n = 1, &blk)
  n.times { array = array.map(&blk) }
  array
end

def proctition(array, &blk)
  array.select(&blk) + array.reject(&blk)
end

def selected_map!(array, prc1, prc2)
  array.map! { |e| prc1.call(e) ? prc2.call(e) : e }
  nil
end

def chain_map(num, prcs)
  prcs.each { |prc| num = prc.call(num) }
  num
end

def proc_suffix(sentence, hash)
  sentence.split.map do |word|
    to_change = word.dup
    hash.each { |k, v| to_change += v if k.call word }
    to_change
  end.join(" ")
end

def proctition_platinum(array, *prcs)
  hash = Hash.new() { |h, k| h[k] = [] }
  array.inject(hash) do |a, e|
    prcs.each_with_index { |pr, i| pr.call(e) ? (a[i + 1] << e; break) : a[i + 1] }
    a
  end
end

def procipher(sentence, hash)
  sentence.split.map do |word|
    to_change = word.dup
    hash.each { |h, k| to_change = k.call(to_change) if h.call(word) }
    to_change
  end.join(" ")
end

def picky_procipher(sentence, hash)
  sentence.split.map do |word|
    hash.each { |h, k| (word = k.call(word); break) if h.call(word) }
    word
  end.join(" ")
end
