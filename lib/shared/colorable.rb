module Colorable
  def colorify(white_array)
    colorified_array = []
    white_array.each do |letter|
      colorified_array.push color.colorize(@color_list[letter.to_sym].to_sym)
    end

    colorified_array.join('')
  end
end
