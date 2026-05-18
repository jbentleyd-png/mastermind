class Guess
  require_relative 'colorable'
  include Colorable

  attr_accessor :guess_array

  def initialize(guess_array)
    @guess_array = guess_array
    color_list
  end
end
