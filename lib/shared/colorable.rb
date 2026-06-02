module Colorable
  @@class_colors = {
    R: 'red',
    G: 'green',
    B: 'blue',
    W: 'white',
    P: 'magenta',
    Y: 'yellow'
  }
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

  def self.colorify_outside_string(white_string)
    colorified_array = []
    white_array = white_string.chars
    p white_array
    white_array.each do |letter|
      colorified_array.push letter.colorize(@@class_colors[letter.to_sym].to_sym)
    end

    colorified_array.join('')
  end
end
