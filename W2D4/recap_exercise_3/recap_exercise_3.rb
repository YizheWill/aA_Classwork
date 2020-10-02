def no_dupes?(arr)
  arr.select { |ele| arr.one?(ele) }
end

# [1, 1, 1, 2, 2, 3, 4]
# .uniq => [1, 2, 3, 4]
# arr - .uniq => [1, 1, 2]
# arr.uniq - (arr - uniq) => [3, 4]
# p no_dupes?([1, 1, 2, 1, 3, 2, 4])         # => [3, 4]
# p no_dupes?(["x", "x", "y", "z", "z"])     # => ['y']
# p no_dupes?([true, true, true])            # => []

def no_consecutive_repeats?(array)
  (0...array.length - 1).each do |i|
    return false if array[i] == array[i + 1]
  end
  true
end

# p no_consecutive_repeats?(["cat", "dog", "mouse", "dog"])     # => true
# p no_consecutive_repeats?(["cat", "dog", "dog", "mouse"])     # => false
# p no_consecutive_repeats?([10, 42, 3, 7, 10, 3])              # => true
# p no_consecutive_repeats?([10, 42, 3, 3, 10, 3])              # => false
# p no_consecutive_repeats?(["x"]) # => true

def char_indices(str)
  hash = Hash.new { |h, k| h[k] = [] }
  str.each_char.with_index do |c, i|
    hash[c] << i
  end
  hash
end

# p char_indices("mississippi")   # => {"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]}
# p char_indices("classroom")     # => {"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]}

def longest_streak(str)
  longest = ""
  i = 0
  while i < str.length
    streak = str[i]
    while str[i] == str[i + 1]
      streak += str[i + 1]
      i += 1
    end
    longest = streak if streak.length >= longest.length
    i += 1
  end
  longest
end

# p longest_streak("a")           # => 'a'
# p longest_streak("accccbbb")    # => 'cccc'
# p longest_streak("aaaxyyyyyzz") # => 'yyyyy
# p longest_streak("aaabbb")      # => 'bbb'
# p longest_streak("abc")         # => 'c'
require "Prime"

def bi_prime?(num)
  (2..num).each do |i|
    (2..num).each do |j|
      return true if j.prime? && i.prime? && i * j == num
    end
  end
  false
end

# p bi_prime?(14)   # => true
# p bi_prime?(22)   # => true
# p bi_prime?(25)   # => true
# p bi_prime?(94)   # => true
# p bi_prime?(24)   # => false
# p bi_prime?(64)   # => false

def vigenere_cipher(string, array)
  alphabet = ("a".."z").to_a
  result = string.dup
  (0...string.length).each do |i|
    if alphabet.include?(string[i].downcase)
      cap = (string[i] == string[i].upcase)
      new_char = alphabet[(alphabet.index(string[i]) + array[i % array.length]) % 26]
      result[i] = cap ? new_char.upcase : new_char
    end
  end
  result
end

# p vigenere_cipher("toerrishuman", [1])        # => "upfssjtivnbo"
# p vigenere_cipher("toerrishuman", [1, 2])     # => "uqftsktjvobp"
# p vigenere_cipher("toerrishuman", [1, 2, 3])  # => "uqhstltjxncq"
# p vigenere_cipher("zebra", [3, 0])            # => "ceerd"
# p vigenere_cipher("yawn", [5, 1])             # => "dbbo"

def vowel_rotate(str)
  chars = str.chars
  vowel = "aeiouAEIOU"
  placeholder = ""
  chars.each_with_index do |char, i|
    if vowel.include?(char)
      placeholder, chars[i] = chars[i], placeholder
    end
  end
  chars[chars.index("")] = placeholder
  chars.join("")
end

# p vowel_rotate("computer")      # => "cempotur"
# p vowel_rotate("oranges")       # => "erongas"
# p vowel_rotate("headphones")    # => "heedphanos"
# p vowel_rotate("bootcamp")      # => "baotcomp"
# p vowel_rotate("awesome")       # => "ewasemo"

class String
  def select(&blk)
    blk ||= Proc.new { false }
    self.chars.inject("") { |acc, char| blk.call(char) ? acc += char : acc }
  end

  def map!(&blk)
    blk ||= Proc.new { |ele| ele }
    self.each_char.with_index do |c, i|
      self[i] = blk.call(self[i], i)
    end
    self
  end
end

# p "app academy".select { |ch| !"aeiou".include?(ch) }   # => "pp cdmy"
# p "HELLOworld".select { |ch| ch == ch.upcase }          # => "HELLO"
# p "HELLOworld".select          # => ""

# word_1 = "Lovelace"
# word_1.map! do |ch|
#   if ch == "e"
#     "3"
#   elsif ch == "a"
#     "4"
#   else
#     ch
#   end
# end
# p word_1        # => "Lov3l4c3"

# word_2 = "Dijkstra"
# word_2.map! do |ch, i|
#   if i.even?
#     ch.upcase
#   else
#     ch.downcase
#   end
# end
# p word_2        # => "DiJkStRa"

def multiply(n1, n2)
  return 0 if n1 == 0
  n1 > 0 ? multiply(n1 - 1, n2) + n2 : multiply(n1 + 1, n2) - n2
end

# p multiply(3, 5)        # => 15
# p multiply(5, 3)        # => 15
# p multiply(2, 4)        # => 8
# p multiply(0, 10)       # => 0
# p multiply(-3, -6)      # => 18
# p multiply(3, -6)       # => -18
# p multiply(-3, 6)       # => -18
def lucas_sequence(n)
  return [] if n == 0
  return [2] if n == 1
  return [2, 1] if n == 2
  prev = lucas_sequence(n - 1)
  prev << (prev[-1] + prev[-2])
end

# Examples
# p lucas_sequence(1)   # => [2]
# p lucas_sequence(2)   # => [2, 1]
# p lucas_sequence(3)   # => [2, 1, 3]
# p lucas_sequence(6)   # => [2, 1, 3, 4, 7, 11]
# p lucas_sequence(8)   # => [2, 1, 3, 4, 7, 11, 18, 29]

def prime_factorization(num)
  return [num] if num.prime?
  (2...num).each do |i|
    if num % i == 0
      return prime_factorization(i) + prime_factorization(num / i)
    end
  end
end

# p prime_factorization(12)     # => [2, 2, 3]
# p prime_factorization(24)     # => [2, 2, 2, 3]
# p prime_factorization(25)     # => [5, 5]
# p prime_factorization(60)     # => [2, 2, 3, 5]
# p prime_factorization(7)      # => [7]
# p prime_factorization(11)     # => [11]
# p prime_factorization(2017)   # => [2017]
