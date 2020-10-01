# cd Desktop
# mkdir test
# cd test
# touch Gemfile
# echo "source 'https://rubygems.org'" >> Gemfile
# echo 'gem "byebug"' >> Gemfile
# echo 'gem "rspec", "~> 3.2.0' >> Gemfile
# ls

def palindrome?(string)
  string.each_char.with_index do |c, i|
    if i > string.length / 2
      break
    end
    if string[i] != string[string.length - i - 1]
      return false
    end
  end
  return true
end

def substrings(str)
  result = []
  str.each_char.with_index do |c, i|
    str.each_char.with_index do |char, idx|
      if idx >= i
        result << str[i..idx]
      end
    end
  end
  result
end

def palindrome_substrings(string)
  substrings(string).select { |word| palindrome?(word) && word.length > 1 }
end
