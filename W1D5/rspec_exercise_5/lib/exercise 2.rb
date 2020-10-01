def zip(*a)
    return a.transpose
end

def prizz_proc(arr, prc1, prc2)
  arr.select {|e| prc1.call(e) && !prc2.call(e) || !prc1.call(e) && prc2.call(e)}
end

def zany_zip(*a)
    len = 0
    a.each { |sub| len = sub.length if sub.length > len }
    a.each { |sub| sub[len - 1] = nil if sub.length < len}
    a.transpose
end

def maximum(arr, &block)
  return nil if arr.empty?
  results = arr.map {|e| block.call(e)}
  el = results.max
  arr[arr.length - 1 - results.reverse.index(el)]
end

def my_group_by(a, &p)
   
    h = Hash.new( Array.new )
    a.inject(h) do |acc, e|
        acc[p.call(e)] += [e]
        acc
    end

end

# def max_tie_breaker(arr, prc, &block)
#   return nil if arr.empty?
#   results = arr.map {|e| block.call(e)}
#   el = results.max
#   max_indice = Array.new(results.length, false)
#   results.each_with_index {|e, i| max_indice[i] = true if e == el}
#   if results.select { |e| e == el }.length > 1 
#     prc_results = []
#     max_prc = 0
#     max_prc_i = 0
#     (0...max_indice.length).each do |i| 
#       if max_indice[i]
#         if prc.call(arr[i]) > max_prc
#           max_prc = prc.call(arr[i])
#           max_prc_i = i
#         end
#       end
#     end
#     return arr[max_prc_i]
#   else
#     maximum(arr,&block)
#   end

# end

def max_tie_breaker(arr, prc, &blk)
    new_array = arr.select { |e| blk.call(e) == arr.map(&blk).max }
    return new_array[0] if new_array.length == 1
    new_array.select { |e| prc.call(e) == new_array.map{ |ele| prc.call(ele) }.max }[0]
end

def silly_syllables(sent)
    sent.split().map do |word|
        if syllable_count?(word)
            first, last = first_and_last_index(word)
            word[first..last]
        else
            word
        end
    end
    .join(" ")
end

def syllable_count?(word)
    count = word.chars.count { |char| "aeiouAEIOU".include?(char) }
    return true if count >= 2
    false
end

def first_and_last_index(word)
    first = 0
    last = 0
    (0...word.length).each do |i|
        if "aeiouAEIOU".include?(word[i])
            first = i
            break
        end
    end

    (word.length - 1).downto(0).each do |i|
        if "aeiouAEIOU".include?(word[i])
            last = i
            break
        end
    end
    [first, last]
end

