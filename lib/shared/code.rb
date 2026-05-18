class Code
  attr_accessor :pegs, :solved

  def initialize(mode_or_array)
    @pegs = []
    if mode_or_array == 'guess_mode'
      4.times do
        @pegs.push ACCEPTABLE[rand(0..5)]
      end
    else
      @pegs = mode_or_array
    end
    @solved = false
  end

  def array_subtract(a, b)
    result = a.dup
    b.each { |color| result.delete_at(result.index(color)) if result.include?(color) }
    result
  end

  def white_count(guess_array)
    4 - array_subtract(@pegs, guess_array).length
  end

  def red_white_count(white_count, guess_array)
    true_color_and_position = 0
    guess_array.each_with_index do |color, index|
      next unless @pegs[index] == color

      true_color_and_position += 1
      # decrement reds from whites

      white_count -= 1
    end

    [true_color_and_position, white_count]
  end

  def check_win(red_count)
    return unless red_count == @pegs.length

    @solved = true
  end

  def check(guess_array)
    white_count = white_count(guess_array)
    raw_output = red_white_count(white_count, guess_array)
    check_win(raw_output[0])
    output_message = []
    (1..raw_output[0]).each { output_message.push '*'.red }

    (1..raw_output[1]).each { output_message.push '*' }

    output_message.join('')
  end
end
