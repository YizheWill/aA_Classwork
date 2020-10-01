# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
  compressed = ""
  counter = 1
  str.each_char.with_index do |char, index|
    if (char == str[index + 1])
      counter += 1
    elsif (char != str[index + 1])
      if counter == 1
        compressed += char
      else
        compressed += counter.to_s + char
        counter = 1
      end
    end
  end
  compressed
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"
