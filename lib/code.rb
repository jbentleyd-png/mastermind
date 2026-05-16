class Code
  attr_accessor :pegs

  def initialize
    @pegs = %w[R G B W]
  end

  def raw_result(guess_array)
    true_color_false_positon = 0
    true_color_and_position = 0
    # check white (right color, wrong spot)
    guess_array.each do |color|
      true_color_false_positon += 1 if @pegs.include?(color)
    end
    # check red (right color and spot)
    guess_array.each_with_index do |color, index|
      next unless @pegs[index] == color

      true_color_and_position += 1
      # decrement reds from whites
      true_color_false_positon -= 1
    end
    [true_color_false_positon, true_color_and_position]
  end

  def check(guess_array)
    raw_output = raw_result(guess_array)
    output_message = []
    for i in 1..raw_output[0]
      output_message.push '*'.red
    end
    for i in 1..raw_output[1]
      output_message.push '*'
    end
    output_message.join('')
  end
end
