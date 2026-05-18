class BoardRow
  attr_accessor :output

  def initialize(turn, colorified_guess, feedback)
    turn_text = turn < 10 ? "##{turn}: " : "##{turn}:"
    @output = "#{turn_text}#{colorified_guess} #{feedback}"
  end
end
