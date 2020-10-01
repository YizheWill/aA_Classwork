require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game
    attr_reader :current_player

    def initialize(size_of_board, player_marks)
        @players = []
        player_marks.each do |mark, type|
            if type == true
                @players << ComputerPlayer.new(mark)
            else
                @players << HumanPlayer.new(mark)
            end
        end
        @current_player = @players[0]
        @board = Board.new(size_of_board)
    end

    def switch_turn
        @players.rotate!
        @current_player = @players[0]
    end

    def play
        while @board.empty_positions?
            @board.print_board
            suc = @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark_value)
            while !suc
                suc = @board.place_mark(@current_player.get_position(@board.legal_positions), @current_player.mark_value)
            end
            if @board.win?(@current_player.mark_value)
                p 'victory'
                p "#{@current_player.mark_value} won the game!"
                return
            else
                switch_turn
            end
        end
        p 'draw'
    end
end

# game = Game.new(:X, :O)
# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player
# game.switch_turn
# p game.current_player

# game = Game.new(4, :X, :Y, :Z)
# game.play