
#problem 1

def index_last_vowel(word)
    length = word.length - 1

    (length.downto 0).each do |i|
        return i if 'aeiou'.include?(word[i])
    end

    return false 
end

def hipsterfy(word)
    last_index = index_last_vowel(word)
    last_index ? word[0...last_index] + word[last_index + 1..-1] : word
end

#problem 2

def vowel_counts(string)
  hash = Hash.new(0)
  new_string = string.downcase
  vowel = "aeiou"
  new_string.each_char do |char|
    if vowel.include?(char)
      hash[char] += 1
    end
  end
  hash
end


#problem 3 


def caesar_cipher(string, num)
    alphabet = ('a'..'z').to_a
    string.chars.map do |char|
        if alphabet.include?(char)
            alphabet[(alphabet.index(char) + num) % alphabet.length]
        else 
            char
        end 
    end .join("")
end