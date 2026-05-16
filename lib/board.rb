class Board
  def initialize(code)
    @code = code
    @round_number = 0
    @rows = ['匿匿匿匿']
  end

  def add_row(guess_array)
    @round_number += 1
    new_guess = Guess.new(guess_array)
    guess_output = new_guess.guess_array # later: new_guess.colorize
    feedback_output = @code.check(guess_array) # return true if solved, pass up the chain
    new_row = BoardRow.new(@round_number, guess_output, feedback_output)
    @rows.push new_row.output
  end

  def display
    puts ''
    puts 'BOARD:'
    puts @rows
  end
end
