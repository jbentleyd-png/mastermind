class Code
  attr_accessor :pegs, :solved

  def initialize
    @pegs = %w[R G B W]
    @solved = false
  end

  def white_count(guess_array)
    true_color_false_positon = 0
    modifiable_pegs = @pegs.dup # CRITICAL
    # check white (right color, wrong spot)
    guess_array.each do |color|
      if modifiable_pegs.include?(color)
        true_color_false_positon += modifiable_pegs.count(color)
        modifiable_pegs.delete(color)
      end
    end
    puts "white : #{true_color_false_positon}"
    true_color_false_positon
  end

  def red_white_count(white_count, guess_array)
    true_color_and_position = 0
    guess_array.each_with_index do |color, index|
      p index
      p @pegs[index]
      p color
      next unless @pegs[index] == color

      true_color_and_position += 1
      # decrement reds from whites
      puts "red : #{true_color_and_position}"
      white_count -= 1
    end

    puts "red : #{true_color_and_position}"
    puts "white : #{white_count}"
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
    for i in 1..raw_output[0]
      output_message.push '*'.red
    end

    for i in 1..raw_output[1]
      output_message.push '*'
    end

    output_message.join('')
  end
end
