class Guess
  attr_accessor :guess_array

  def initialize(guess_array)
    @guess_array = guess_array
    @color_list = {
      R: 'red',
      G: 'green',
      B: 'blue',
      W: 'white',
      P: 'magenta',
      Y: 'yellow'
    }
  end

  def colorify
    colorified_array = []
    @guess_array.each do |color|
      colorified_array.push color.colorize(@color_list[color.to_sym].to_sym)
    end

    colorified_array.join('')
  end
end
