require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'

def guess_input
  guess_array = []
  for i in 1..4
    print "Color #{i}: "
    guess_array.push gets.chomp.upcase
  end
  guess_array
end

def play_mastermind
  code = Code.new
  board = Board.new(code)
  board.display
  board.add_row(guess_input)
  board.display
end

play_mastermind
