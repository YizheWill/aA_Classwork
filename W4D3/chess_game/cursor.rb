class Cursor
  def initialize(board, cursor_pos)
    @board = board
    @cursor_pos = []
    @selected = false
  end

  def get_input
    p "please give me some input,which chess piece you want to move?"
    location = gets.chomp
    pos = location.split(",").map { |e| e.strip.to_i }
  end

  def toggle_selected
  end

  def handle_key(key)
  end

  def read_char
  end

  def update_pos(diff)
  end
end
