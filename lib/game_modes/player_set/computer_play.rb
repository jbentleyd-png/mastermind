class ComputerPlay
  def initialize
    @useful_colors = []
    @unguessed_colors = ACCEPTABLE.dup
    @confirmed_peg = { color: nil, position: nil }
    @guessed_permutations = []
  end

  def opening_guess
    guess_array = []
    4.times do
      guess_array.push ACCEPTABLE[rand(0..5)]
    end
    @guessed_permutations.push guess_array
    guess_array
  end

  def find_confirmed_peg(turn)
    # walk through left to right
    @guessed_permutations.push @guessed_permutations[turn - 2].dup
    @guessed_permutations[turn - 1][turn - 1 ] = @guessed_permutations[turn - 1][turn - 2]
    @guessed_permutations[turn - 1]
  end

  def find_useful_colors
    # check confirmed color, non-used colors
  end

  def guess_final_code
    # randomize known values outside of confirmed spot
  end

  def execute_strategy(turn)
    return opening_guess if turn == 1

    return find_confirmed_peg(turn) if @confirmed_peg[:color].nil?

    return find_useful_colors if @useful_colors.length < 4

    guess_final_code
  end
end
