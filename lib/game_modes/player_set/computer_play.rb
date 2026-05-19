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

  def take_feedback(feedback_output, round_number)
    @feedback_log.push feedback_output
    puts "feedback log: #{@feedback_log}"
    if @feedback_log[-1] != '' && round_number <= 6 # rubocop:disable Style/GuardClause
      color_count = feedback_log[-1].count('*')
      color_count.times { @useful_colors.push @guessed_permutations[-1][0] }
      puts "useful colors array: #{@useful_colors}"
    end
  end

  def find_useful_colors
    guess_array = []
    random_color = @unguessed_colors[rand(0...@unguessed_colors.length)]
    4.times { guess_array.push random_color }
    @guessed_permutations.push guess_array
    @unguessed_colors.delete(random_color)
    puts "remaining colors: #{@unguessed_colors}"
    guess_array
  end

  def guess_final_code
    # randomize known values outside of confirmed spot
  end

  def execute_strategy(turn)
    find_useful_colors unless turn > 6 || @useful_colors.length == 4
  end
end
