# require_relative "./dic.rb"
class Hangman
  attr_reader :guess_word, :attempted_chars, :remaining_incorrect_guesses
  # DICTIONARY = DIC
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  def self.random_word
    DICTIONARY.sample
  end
  
  def initialize()
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def already_attempted?(char)
    return true if @attempted_chars.include?(char)
    false
  end

  def get_matching_indices(char)
    @secret_word.each_char.with_index.inject([]) do |a,(c,i)|
      c == char ? a << i : a
    end
  end
  
  def fill_indices(char,arr)
   arr.each { |i| @guess_word[i] = char} #
  end

  def try_guess(char)
    if already_attempted?(char)
      p 'that has already been attempted'
      return false
    else
      @attempted_chars << char
      if @secret_word.include?(char)
        fill_indices(char, get_matching_indices(char))
      else
        @remaining_incorrect_guesses -= 1
      end
      return true
    end
  end

  def ask_user_for_guess
    p "Enter a char:"
    char = gets.chomp
    try_guess(char)
  end

  def win?
    if @guess_word.join("") == @secret_word 
      p "WIN"
      return true
    else
      false
    end
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      true
    else
      false
    end
  end
  def game_over?
    (win? || lose?) ?  (p @secret_word; true) : false
  end

end

# 42.org
# geeksquad replacement plan 
