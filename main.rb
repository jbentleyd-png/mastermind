require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'

def play_mastermind
  code = Code.new
  board = Board.new(code)
  board.display
end

play_mastermind
