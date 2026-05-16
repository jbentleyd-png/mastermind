class Board
  def initialize(code)
    @code = code
    @round_number = 0
    @rows = ['匿匿匿匿']
  end

  def add_row(guess)
    @round_number += 1
    guess_output = guess.colorize
    feedback_output = @code.check(guess)
    output = "#{round_number} #{guess_output} #{feedback_output}"
    @rows.push output
  end

  def display
    puts @rows
  end
end
