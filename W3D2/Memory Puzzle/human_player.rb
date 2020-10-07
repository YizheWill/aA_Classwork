class HumanPlayer
    attr_accessor :previous_pos
    attr_reader :player_value
    def initialize()
      @previous_pos = nil
    end
    def get_move(size,previously_revealed)
        puts "Please enter a position as row col"
        pos = gets.chomp.split(" ").map(&:to_i)
        while !valid_move?(size, pos, previously_revealed)
          puts "Invalid Position"
            pos = gets.chomp.split(" ").map(&:to_i)
        end
        return pos
    end

    def valid_move?(size, pos,previously_revealed)
        row, col = pos
        return false if previously_revealed.include?(pos)
        return false if pos.any?{|ele| ele<0 || ele>=size}
        return false if pos == @previous_pos
        return true
    end
end