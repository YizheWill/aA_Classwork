

  #PROBLEM 1

  def all_words_capitalized?(array)
    array.all? { |word| word.capitalize == word}
  end


  #PROBLEM 2

  def no_valid_url?(array)
    array.none? {|url| url.end_with?('.com', '.net', '.io', '.org')}
  end

  
#PROBLEM 3

def any_passing_students?(array)
    array.any? do |student|
        (student[:grades].sum / student[:grades].length) > 75
    end
end