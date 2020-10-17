def anagrams?(str1, str2)
  a = str1.split("").permutation.to_a.map(&:join)
  a.include?(str2)
end
# p anagrams?("gizmo", "sally")
# p anagrams?("elvis", "lives")
# O(n!)

def second_anagram?(str1, str2)
  return false if str1.length != str2.length
  chars2 = str2.chars
  str1.each_char do |letter|
    idx = chars2.index(letter) 
    return false if !idx
    chars2.delete_at(idx) 
  end
  if chars2.length == 0
    return true
  else
    return false
  end
end
#O(n^2)
#  p second_anagram?("gizmo", "sally")
#  p second_anagram?("elvis", "lives")
def third_anagram?(str1,str2)
    return str1.chars.sort == str2.chars.sort
end
#O(nlog(n))

# p third_anagram?("gizmo", "sally")
# p third_anagram?("elvis", "lives")

def fourth_anagram?(str1,str2)
    str1.chars.inject(Hash.new(0)) {|a,e| a[e] +=1 ; a } == str2.chars.inject(Hash.new(0)) {|a,e| a[e] +=1 ; a }
end

#O(n)

def fifth_anagram?(str1,str2)
    hash = Hash.new(0)
    str1.each_char {|char| hash[char] +=1}
    str2.each_char {|char| hash[char] -=1}
    return hash.values.all?(&:zero?)
end

#O(n)
p fifth_anagram?("gizmo", "sally")
p fifth_anagram?("elvis", "lives")