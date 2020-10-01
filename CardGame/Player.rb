require_relative "Person.rb"

class Player < Person
  attr_accessor :alias_name, :cards, :cash

  def initialize()
    super()
    p "please type your alias name"
    @alias_name = gets.chomp!
    @cards = []
    @cash = @bank.cash_available
  end

  def show_cards()
    sort_cards
    @cards.each do |card|
      puts "#{card.suit} of #{card.rank}"
    end
  end

  def sort_cards()
    sorted = false
    while !sorted
      sorted = true
      (0...@cards.length - 1).each do |i|
        if @cards[i].rank > @cards[i + 1].rank
          @cards[i], @cards[i + 1] = @cards[i + 1], @cards[i]
          sorted = false
        end
      end
    end
  end

  def check_heart_of_three()
    @cards.each do |card|
      if card.rank == 3 && card.suit == "HEART"
        p "#{@alias_name} has the heart of three"
        sleep 1
        return true
      end
    end
    false
  end

  def random_a_card()
    p "#{@alias_name}'s turn, and #{@alias_name}'s cards are"
    show_cards
    p "#{@alias_name} please choose a card, just type the ranking is ok, you cannot pass"
    cardrank = gets.chomp.to_i
    while @cards.none? { |ca| ca.rank == cardrank }
      p "invalid, choose again"
      cardrank = gets.chomp.to_i
    end
    @cards.each_with_index do |e, i|
      if e.rank == cardrank
        deletedcard = @cards.delete_at(i)
        p "#{@alias_name} throw out #{deletedcard.suit} #{deletedcard.rank}"
        sleep 1
        return deletedcard
      end
    end
  end

  def pass?(c)
    p "#{@alias_name}'s turn and the cards are"
    show_cards

    if @cards.none? { |card| card.rank > c.rank }
      p "no available card, #{@alias_name} has to passed"
      sleep 1
      return true
    else
      p "choose a card that has a ranking greater than #{c.rank}, type the rank is fine, if you decided to pass, just type pass"
      cardrank = gets.chomp!
      if cardrank == "pass"
        p "#{@alias_name} decided to pass"
        sleep 1
        return true
      end
      cardrank = cardrank.to_i
      while @cards.none? { |ca| ca.rank == cardrank } || cardrank <= c.rank
        p "invalid, choose again"
        cardrank = gets.chomp!
        if cardrank == "pass"
          p "#{@alias_name} decided to passed"
          sleep 1
          return true
        elsif cardrank.to_i < c.rank
          p "invalid, card too small, choose again"
          cardrank = gets.chomp!
          if cardrank == "pass"
            p "#{@alias_name} decided to passed"
            sleep 1
            return true
          end
          cardrank = cardrank.to_i
        else
          cardrank = cardrank.to_i
        end
      end
      @cards.each_with_index do |e, i|
        if e.rank == cardrank
          deletedcard = @cards.delete_at(i)
          p "#{@alias_name} throw out #{deletedcard.suit} #{deletedcard.rank}"
          sleep 1
          return deletedcard
        end
      end
    end

    p "fault"
    sleep 1
    return false
  end

  def win?
    return self if @cards.empty?
    return false
  end
end
