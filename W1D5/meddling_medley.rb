# Meddling Medley

# Phase 1: Modest problems.

def duos(string)
  counter = 0
  string.each_char.with_index do |char, i|
    if char == string[i + 1]
      counter += 1
    end
  end
  return counter
end

# p duos('bootcamp')      # 1
# p duos('wxxyzz')        # 2
# p duos('hoooraay')      # 3
# p duos('dinosaurs')     # 0
# p duos('e')             # 0

def sentence_swap(sent, h)
    sent.split().map do |word|
        h.has_key?(word) ? h[word] : word
    end
    .join(" ")
end

# p sentence_swap('anything you can do I can do',
#     'anything'=>'nothing', 'do'=>'drink', 'can'=>'shall'
# ) # 'nothing you shall drink I shall drink'

# p sentence_swap('what a sad ad',
#     'cat'=>'dog', 'sad'=>'happy', 'what'=>'make'
# ) # 'make a happy ad'

# p sentence_swap('keep coding okay',
#     'coding'=>'running', 'kay'=>'pen'
# ) # 'keep running okay'


def hash_mapped(hash, prc, &blk) # h[blk_result] => prc_result
  res = Hash.new()
  hash.each do |k, v|
    res[blk.call(k)] = prc.call(v)
  end
  res
end


# double = Proc.new { |n| n * 2 }
# p hash_mapped({'a'=>4, 'x'=>7, 'c'=>-3}, double) { |k| k.upcase + '!!' }
# # {"A!!"=>8, "X!!"=>14, "C!!"=>-6}

# first = Proc.new { |a| a[0] }
# p hash_mapped({-5=>['q', 'r', 's'], 6=>['w', 'x']}, first) { |n| n * n }
# # {25=>"q", 36=>"w"}


def counted_characters(s)
    res = []
    s.each_char do |char|
        s.chars.count(char) > 2 && !res.include?(char) ? res << char : char
    end
    res
end

# p counted_characters("that's alright folks") # ["t"]
# p counted_characters("mississippi") # ["i", "s"]
# p counted_characters("hot potato soup please") # ["o", "t", " ", "p"]
# p counted_characters("runtime") # []

def triplet_true(string)
  counter = 1
  string.each_char.with_index do |char, i|
    if char == string[i + 1] 
      counter += 1
      return true if counter == 3
    else
      counter = 1
    end
  end
  return false
end

# p triplet_true('caaabb')        # true
# p triplet_true('terrrrrible')   # true
# p triplet_true('runninggg')     # true
# p triplet_true('bootcamp')      # false
# p triplet_true('e')             # false

def energetic_encoding(s, h)
    s.chars.map do |char|

        if h[char]
            h[char]
        elsif char == " "
            " "
        else
            "?"
        end

    end.join("")
end

# p energetic_encoding('sent sea',
#     'e'=>'i', 's'=>'z', 'n'=>'m', 't'=>'p', 'a'=>'u'
# ) # 'zimp ziu'

# p energetic_encoding('cat',
#     'a'=>'o', 'c'=>'k'
# ) # 'ko?'

# p energetic_encoding('hello world',
#     'o'=>'i', 'l'=>'r', 'e'=>'a'
# ) # '?arri ?i?r?'

# p energetic_encoding('bike', {}) # '????'

def uncompress(string)
    res = ""
    string.each_char.with_index do |c, i|
      if i.even?
        res += c*(string[i+1].to_i)
      end
    end
    res
end

# p uncompress('a2b4c1') # 'aabbbbc'
# p uncompress('b1o2t1') # 'boot'
# p uncompress('x3y1x2z4') # 'xxxyxxzzzz'

# Phase 2: More difficult, maybe?

def conjunct_select(a, *procs_array)
    a.select { |e| procs_array.all? { |proc| proc.call(e) } }
end

is_positive = Proc.new { |n| n > 0 }
is_odd = Proc.new { |n| n.odd? }
less_than_ten = Proc.new { |n| n < 10 }

# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive) # [4, 8, 11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd) # [11, 7, 13]
# p conjunct_select([4, 8, -2, 11, 7, -3, 13], is_positive, is_odd, less_than_ten) # [7]

def convert_pig_latin(sent)
  words = sent.split()
  vowels = "aeiouAEIOU"
  words.map do |word|
    if word.length < 3
      word
    elsif vowels.include?(word[0])
      word+"yay"
    else
      cap = true if word == word.capitalize
      word.each_char.with_index do |char, i|
        if vowels.include?(char)
          word = word[i..-1] + word[0..i-1] + "ay"
          break
        end
      end
      word.capitalize! if cap
      word
    end
  end.join(' ')
end

# p convert_pig_latin('We like to eat bananas') # "We ikelay to eatyay ananasbay"
# p convert_pig_latin('I cannot find the trash') # "I annotcay indfay ethay ashtray"
# p convert_pig_latin('What an interesting problem') # "Atwhay an interestingyay oblempray"
# p convert_pig_latin('Her family flew to France') # "Erhay amilyfay ewflay to Ancefray"
# p convert_pig_latin('Our family flew to France') # "Ouryay amilyfay ewflay to Ancefray"

def reverberate(sent)
    vowels = "aeiouAEIOU"
    sent.split().map do |word|
        if word.length < 3
            word
        elsif vowels.include?word[-1]
            if word == word.capitalize
                (word + word).capitalize
            else
                word + word
            end
        else
            cap = true if word == word.capitalize
            (word.length - 1).downto(0).each do |i|
                if vowels.include?(word[i])
                    word = word + word[i..-1]
                    break
                end
            end
            cap ? word.capitalize : word
        end
    end.join(" ")
end

# p reverberate('We like to go running fast') # "We likelike to go runninging fastast"
# p reverberate('He cannot find the trash') # "He cannotot findind thethe trashash"
# p reverberate('Pasta is my favorite dish') # "Pastapasta is my favoritefavorite dishish"
# p reverberate('Her family flew to France') # "Herer familyily flewew to Francefrance"

def disjunct_select(array, *procs_array)
 array.select { |e| procs_array.any? { |proc| proc.call(e) } } 
end

# longer_four = Proc.new { |s| s.length > 4 }
# contains_o = Proc.new { |s| s.include?('o') }
# starts_a = Proc.new { |s| s[0] == 'a' }

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
# ) # ["apple", "teeming"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o
# ) # ["dog", "apple", "teeming", "boot"]

# p disjunct_select(['ace', 'dog', 'apple', 'teeming', 'boot', 'zip'],
#     longer_four,
#     contains_o,
#     starts_a
# ) # ["ace", "dog", "apple", "teeming", "boot"]

VOWELS = "aeiouAEIOU"

def alternating_vowel(sent)
    sent.split().map.with_index do |word, i|
        i.even? ? remove_first_vowel(word) : remove_last_vowel(word)
    end.join(" ")
end

def remove_first_vowel(w)
    w.each_char.with_index do |c, i|
        if VOWELS.include?(c)
            return w[0...i] + w[i+1..-1]
        end
    end
    w
end

def remove_last_vowel(w)
    (w.length-1).downto(0).each do |i|
        if VOWELS.include?(w[i])
            return w[0...i] + w[i+1..-1]
        end
    end
    w
end


# p alternating_vowel('panthers are great animals') # "pnthers ar grat animls"
# p alternating_vowel('running panthers are epic') # "rnning panthrs re epc"
# p alternating_vowel('code properly please') # "cde proprly plase"
# p alternating_vowel('my forecast predicts rain today') # "my forecst prdicts ran tday"


def silly_talk(sent)
  sent.split().map do |w|
    if VOWELS.include?(w[-1])
      w + w[-1]
    else
      cap = true if w == w.capitalize
      newword = ""
      w.each_char.with_index do |c, i|
        if VOWELS.include?(c)
          newword += c + "b" + c    
        else
          newword += c
        end
      end
      if cap
        newword.capitalize
      else
        newword
      end
    end
  end.join(' ')
end

# p silly_talk('Kids like cats and dogs') # "Kibids likee cabats aband dobogs"
# p silly_talk('Stop that scooter') # "Stobop thabat scobooboteber"
# p silly_talk('They can code') # "Thebey caban codee"
# p silly_talk('He flew to Italy') # "Hee flebew too Ibitabaly"

def compress(s)
    i = 0
    result = ""
    while i < s.length
        counter = 1
        while s[i] == s[i+1]
            counter += 1
            i += 1
        end
        if counter == 1
            result += s[i]
            i += 1
        else
            result += s[i-1] + counter.to_s
            i += 1
        end
    end
    result
end

p compress('aabbbbc')   # "a2b4c"
p compress('boot')      # "bo2t"
p compress('xxxyxxzzzz')# "x3yx2z4"