require 'colorize'

require_relative 'lib/shared/code'
require_relative 'lib/shared/guess'
require_relative 'lib/shared/board_row'
require_relative 'lib/shared/board'
require_relative 'lib/shared/colorable'
require_relative 'lib/game_modes/player_guess/player_guess_mode'
require_relative 'lib/game_modes/player_set/player_set_mode'
require_relative 'lib/game_modes/player_set/computer_play'

ACCEPTABLE = %w[R G B W P Y].freeze

def startup_message
  puts "\n\n\t\t\t\tMASTERMIND GAME".blue
  puts "\t\t\t\t***************".blue
  puts 'Would you like to be the code Guesser (input "G"), or the code Setter(input "S")?'
  print "\n\t\t\t       Guesser/Setter: ".green
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
