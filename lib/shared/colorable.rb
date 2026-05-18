module Colorable
  def color_list
    @color_list = {
      R: 'red',
      G: 'green',
      B: 'blue',
      W: 'white',
      P: 'magenta',
      Y: 'yellow'
    }
  end

  def colorify(white_array)
    colorified_array = []
    white_array.each do |letter|
      colorified_array.push letter.colorize(@color_list[letter.to_sym].to_sym)
    end

    colorified_array.join('')
  end
end
