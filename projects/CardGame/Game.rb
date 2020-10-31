require_relative "Deck.rb"
require_relative "Player.rb"

class Game
  attr_accessor :players, :deck

  def initialize()
    p "How many people are playing? must be more that 2 and less than 7"
    @num_of_players = gets.chomp.to_i
    while @num_of_players < 3 || @num_of_players > 6
      p "must between 3 and 6 players"
      @num_of_players = gets.chomp.to_i
    end
    @players = []
    @num_of_players.times do |i|
      @players << Player.new()
    end
  end

  def deal_cards()
    while !@deck.empty?
      @players.each do |player|
        player.cards << @deck.pop
        return if @deck.empty?
      end
    end
  end

  def init_game()
    p "choose card deck, 1: 52, 2: 54, 3: 13"
    num = gets.chomp.to_i
    @deck = Deck.new(num)
    @players.each do |player|
      player.cards = []
    end
    deal_cards
    @players.each_with_index do |player, i|
      return i if player.check_heart_of_three
    end
  end

  def too_big_for_everyone?(i, card)
    @players.each_with_index.none? { |p, idx| i != idx && p.cards.last.rank > card.rank }
  end

  def show_winner
    p @players.select(&:win?)[0]
  end

  def show_all
    @players.each do |player|
      p "player #{player.alias_name}"
      player.show_cards
    end
  end

  def play()
    p "every body is putting 100 dollars on the table"
    @players.each { |p| p.cash -= 100 }
    @cash_pool = @players.length * 100
    i = init_game
    current_card = @players[i].random_a_card
    while @players.none?(&:win?)
      i += 1
      if i == @players.length
        i = 0
      end
      intermediate_result = @players[i].pass?(current_card)
      counter = 0
      while intermediate_result == true
        counter += 1
        i += 1
        if i == @players.length
          i = 0
        end
        break if counter == (@players.length - 1)
        intermediate_result = @players[i].pass?(current_card)
      end
      if counter == (@players.length - 1)
        p "all decided to pass"
        p "#{@players[i].alias_name} play again"
        current_card = @players[i].random_a_card
        next
      end
      current_card = intermediate_result
      # end
    end
    @players.each do |ply|
      if ply.win?
        ply.cash += @cash_pool
        p "winner is #{ply.alias_name}"
        sleep 2
        p "Congratulations to #{ply.alias_name}!!!"
        sleep 2
        p "#{ply.alias_name} won #{@cash_pool} dollars"
        p " "
        sleep 1
        p " "
        sleep 1
        p " "
        sleep 1
        p " "
        sleep 1
        @cash_pool = 0
        break
      end
    end
    @players.each do |ply|
      p "#{ply.alias_name} #{ply.win? ? "WIN the game" : "LOST the game"}"
      sleep 1
      p "now #{ply.alias_name} has #{ply.cash} dollars"
    end
  end

  def new_round()
    while true
      play()
      p "start again"
      @players.map! do |pl|
        if pl.cash < 100
          p pl.alias_name + " player doesn't have enough cash"
          p "#{pl.alias_name}, do you want to play again? y/n"
          answer = gets.chomp
          if answer == "y"
            p "contacting your bank"
            p "....."
            sleep 2
            p "type your username of the bank"
            username = gets.chomp
            p "type your password of the bank"
            password = gets.chomp
            result_from_the_bank = pl.bank.check_auth(username, password)
            if !result_from_the_bank
              p "wrong password, please leave"
              p "New Player Joining us"
              sleep 2
              Player.new()
            else
              draw_result = pl.bank.draw
              if draw_result
                pl.cash += draw_result
                p "#{pl.alias_name} drew #{draw_result} dollars from the bank, and now has #{pl.cash} dollars"
                sleep 2
                p "next player"
                pl
              else
                p "New Player Joining us"
                sleep 2
                Player.new()
              end
            end
          else
            p "New Player Joining us"
            sleep 2
            Player.new()
          end
        else
          pl
        end
      end
    end
  end
end

game = Game.new()
game.new_round
