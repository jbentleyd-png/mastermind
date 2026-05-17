require 'colorize'

require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'

def guess_input
  guess_array = []
  for i in 0...4
    print "Color #{i + 1}: "
    guess_array.push gets.chomp.upcase
  end
  guess_array
end

def play_round(board)
  guess_array = guess_input
  board.add_row(guess_array)
  board.display
  # return true if solved
end

def play_mastermind
  code = Code.new
  board = Board.new(code)
  board.display
  for i in 1..12
    play_round(board)
  end
end

play_mastermind
