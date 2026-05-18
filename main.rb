require 'colorize'

require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'
require_relative 'lib/player_guess_mode'
require_relative 'lib/player_set_mode'

ACCEPTABLE = %w[R G B W P Y].freeze

def startup_message
  puts ''
  puts ''
  puts "\t\t\t\tMASTERMIND GAME".blue
  puts "\t\t\t\t***************".blue
  puts 'Would you like to be the code Guesser (input "G"), or the code Setter(input "S")?'
  puts ''
  print "\t\t\t       Guesser/Setter: ".green
end

def mode_ok?(mode_input) = %w[g s].include?(mode_input)

def force_mode_input
  input = gets.chomp.downcase
  until mode_ok?(input)
    puts "\t\t\t     Invalid input. Try again."
    print "\t\t\t       Guesser/Setter: ".green
    input = gets.chomp.downcase
  end
  input
end

def startup
  startup_message
  mode = force_mode_input == 'g' ? PlayerGuessMode : PlayerSetMode
  mode.play_game
end

startup
# PlayerChoiceMode.play_game
