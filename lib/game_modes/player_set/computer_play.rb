class ComputerPlay
  attr_accessor :feedback_log

  def initialize
    @useful_colors = []
    @unguessed_colors = ACCEPTABLE.dup
    p @unguessed_colors
    @confirmed_peg = { color: nil, position: nil }
    @guessed_permutations = []
    @feedback_log = []
  end

  def take_feedback(feedback_output, turn)
    @feedback_log[turn - 1] = feedback_output
    # p feedback_log
  end

  def opening_guess
    guess_array = []
    random_color = @unguessed_colors[rand(0...@unguessed_colors.length)]
    4.times { guess_array.push random_color }
    @guessed_permutations.push guess_array
    @unguessed_colors.delete(random_color)
    puts "remaining colors: #{@unguessed_colors}"
    guess_array
  end

  def find_useful_colors
    opening_guess
  end
  # check confirmed color, non-used colors

  def guess_final_code
    # randomize known values outside of confirmed spot
  end

  def execute_strategy(turn)
    find_useful_colors if turn <= 6
  end
end
