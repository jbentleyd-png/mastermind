require 'colorize'

require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'

ACCEPTABLE = %w[R G B W P Y].freeze

def input_allowed(input, allowed)
  return false if input.length != 4

  input = input.chars
  difference_array = input - allowed
  difference_array.empty?
end

def force_input
  input = gets.chomp.upcase
  until input_allowed(input, ACCEPTABLE)
    puts "Please input 4 of the following: #{ACCEPTABLE}"
    print 'Guess: '
    input = gets.chomp.upcase
  end
  input
end

def guess_input(round_number)
  prompt = round_number < 10 ? "##{round_number}: " : "##{round_number}:"
  print prompt
  force_input.chars
end

def play_round(board, round_number)
  guess_array = guess_input(round_number)
  board.add_row(guess_array)
  board.display
end

def play_mastermind
  code = Code.new
  board = Board.new(code)
  board.display
  puts 'Let\'s play Mastermind! Try to guess the four-color code (color repeats are possible).'
  (1..12).each do |round_number|
    play_round(board, round_number)
    break if code.solved == true
  end
  if code.solved == true
    puts 'YOU DID IT! YOU ARE THE CHOSEN ONE!'.blue
  else
    code_output = code.pegs.join('')
    puts "You FAIL. Code was #{code_output}.".red
  end
end

play_mastermind
