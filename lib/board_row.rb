class BoardRow
  attr_accessor :output

  def initialize(turn, guess, feedback)
    @output = "##{turn}: #{guess}+  + #{feedback}"
  end
end
