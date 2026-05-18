require 'colorize'

require_relative 'lib/code'
require_relative 'lib/guess'
require_relative 'lib/board_row'
require_relative 'lib/board'
require_relative 'lib/player_guess_mode'

ACCEPTABLE = %w[R G B W P Y].freeze

PlayerChoiceMode.play_game
