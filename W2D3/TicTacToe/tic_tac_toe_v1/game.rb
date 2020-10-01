


require_relative 'board'
require_relative 'human_player'

class Game
    attr_reader :current_player

    def initialize(player_1_mark, player_2_mark)
        @player_1 = HumanPlayer.new(player_1_mark)
        @player_2 = HumanPlayer.new(player_2_mark)
        @current_player = @player_1
        @board = Board.new
    end

    def switch_turn
        @current_player = @current_player == @player_1 ? @player_2 : @player_1
    end

    def play
        while @board.empty_positions?
            @board.print_board
            @board.place_mark(@current_player.get_position, @current_player.mark_value)
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

game = Game.new(:X, :O)
game.play