require 'colorize'

require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'

ACCEPTABLE = %w[R G B W P Y].freeze

def force_input(i)
  input = gets.chomp.upcase
  until ACCEPTABLE.include?(input)
    puts "Please input one of the fallowing: #{ACCEPTABLE}"
    print "Color #{i + 1}: "
    input = gets.chomp.upcase
  end
  input
end

def guess_input
  guess_array = []
  (0...4).each do |i|
    print "Color #{i + 1}: "
    guess_array.push force_input(i)
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
  12.times do
    play_round(board)
    break if code.solved == true
  end
  puts 'YOU DID IT! YOU ARE THE CHOSEN ONE!'.blue
end

play_mastermind
