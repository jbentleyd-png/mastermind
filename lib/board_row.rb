class BoardRow
  attr_accessor :output

  def initialize(turn, colorified_guess, feedback)
    @output = "##{turn}: #{colorified_guess} #{feedback}"
  end
end
