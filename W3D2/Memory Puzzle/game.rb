require_relative "human_player.rb"
require_relative "board"
# require "byebug"
class Game
  attr_reader :size
  def initialize
    puts "Choose card board size: etc 2, 4 or 6"
    @size = gets.chomp.to_i 
    while ![2,4,6].include?(@size)
        puts "Invalid Size"
        @size = gets.chomp.to_i
    end
    @board = Board.new(size)
    @previously_revealed = []
    @previously_guessed_not_hit = [] 
    @human_player = HumanPlayer.new("human")
    @computer_player = HumanPlayer.new("computer")
    @current_player = @human_player
    @human_hits = 0
    @computer_hits = 0
  end

  def play
    @board.render
    while !@board.won?
      @human_player.previous_pos = @human_player.get_move(@size,@previously_revealed)
      @board[@human_player.previous_pos].flip
      system("clear")
      @board.cheat
      @board.render
      current_pos = @human_player.get_move(@size,@previously_revealed)
      @board[current_pos].flip
      system("clear")
      @board.cheat
      @board.render
      if @board[@human_player.previous_pos].face_value != @board[current_pos].face_value
        sleep 2
        @board[@human_player.previous_pos].flip
        @board[current_pos].flip
        system("clear")
        @board.cheat
        @board.render
        @previously_guessed_not_hit.concat([current_pos, @human_player.previous_pos])
        @previously_guessed_not_hit = @previously_guessed_not_hit.uniq
      else
        # @previously_revealed.concat([current_pos, @human_player.previous_pos])
        @board.update_valid_move(current_pos)
        @board.update_valid_move(@human_player.previous_pos)
        @human_hits += 1
      end
      @human_player.previous_pos = nil
      end
      positions = check_2pgh
      if positions 
        @computer_hits +=1 
        @board[positions[0]].flip
        @board[positions[1]].flip
        @board.render
        @board.update_valid_move(positions[0])
        @board.update_valid_move(positions[1])
      else
        pos = @computer_player.get_move
        @computer_player.previous_pos = pos
        @board[pos].flip
        pos2 = check_1pgh(pos)
        if pos2
          @board[pos2].flip
          @board.update_valid_move(pos2)
          @board.update_valid_move(pos)
          @computer_hit += 1
        else
          pos2 = @computer_player.get_move 
          if @board[pos].face_value == @board[pos].face_value
        end
      end

  end

  def check_2pgh
    @previously_guessed_not_hit.each_with_index do |ele1, index1|
        @previously_guessed_not_hit.each_with_index do |ele2, index2|
            if index1 != index2 && @board[ele1].face_value == @board[ele2].face_value
                return [ele1,ele2]
            end
        end
    end
    return false
  end

  def check_1pgh(pos)
    @previously_guessed_not_hit.each do |ele| 
        if @board[ele].face_value == @board[pos].face_value
            return ele
        end
    end
    return false
  end

  def switch!
    case @current_player 
    when @human_player
      @current_player = @computer_player
      @current_player = @human_player
    when @computer_player
    end
  end

end

game = Game.new
game.play



