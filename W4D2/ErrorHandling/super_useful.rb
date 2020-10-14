# PHASE 2
def convert_to_int(str)
  begin
    num = Integer(str)
  rescue ArgumentError
    puts "Unable to convert"
  ensure
    num ||= 0
  end
  num
end

# PHASE 3
FRUITS = ["apple", "banana", "orange"]

class CoffeeError < StandardError
end

class NotAFruitError < StandardError
end

def reaction(maybe_fruit)
  if FRUITS.include? maybe_fruit
    puts "OMG, thanks so much for the #{maybe_fruit}!"
  elsif maybe_fruit == "coffee"
    raise CoffeeError, "Maybe don't need coffee now"
  else
    raise NotAFruitError, "not a fruit man"
  end
end

def feed_me_a_fruit
  puts "Hello, I am a friendly monster. :)"
  begin
    puts "Feed me a fruit! (Enter the name of a fruit:)"
    maybe_fruit = gets.chomp
    reaction(maybe_fruit)
  rescue CoffeeError => e
    p e.message
    retry
  rescue NotReallyaFriend => e
    p e.message
  end
end

# PHASE 4
class NotInteger < StandardError
  def message
    "Not an integer"
  end
end

class NotReallyaFriend < StandardError
  def message
    "Not really a friend"
  end
end

class TellMeYourName < StandardError
  def message
    "At least you will have a name"
  end
end

class Comon < StandardError
  def message
    "Well what can I say"
  end
end

class BestFriend
  def initialize(name, yrs_known, fav_pastime)
    @name = name
    @yrs_known = yrs_known
    @fav_pastime = fav_pastime
    raise NotInteger if !@yrs_known.is_a?(Integer)
    raise NotReallyaFriend if @yrs_known < 5
    raise TellMeYourName if !@name.is_a?(String)
    raise TellMeYourName if @name.length == 0
    raise Comon if !@fav_pastime.is_a?(String) || @fav_pastime.length == 0
  end

  def talk_about_friendship
    puts "Wowza, we've been friends for #{@yrs_known}. Let's be friends for another #{1000 * @yrs_known}."
  end

  def do_friendstuff
    raise
    puts "Hey bestie, let's go #{@fav_pastime}. Wait, why don't you choose. "
  end

  def give_friendship_bracelet
    puts "Hey bestie, I made you a friendship bracelet. It says my name, #{@name}, so you never forget me."
  end
end
