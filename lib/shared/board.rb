class Board
  def initialize(code, mode)
    @code = code
    @round_number = 0
    if mode == 'guess_mode'
      @rows = ['匿匿匿匿'.light_black]
    elsif mode == 'set_mode'
      code_string = code.pegs.join('')
      colored_code = Colorable.colorify_outside_string(code_string)
      @rows = ["[Secret code : #{colored_code}]"]
    end
    @rows.push "Possible inputs: #{ACCEPTABLE}"
  end

  def add_row(guess_array)
    @round_number += 1
    new_guess = Guess.new(guess_array)
    guess_output = new_guess.colorify(guess_array)
    feedback_output = @code.check(guess_array)
    new_row = BoardRow.new(@round_number, guess_output, feedback_output)
    @rows.push new_row.output
  end

  def display
    puts ''
    puts 'BOARD:'
    puts @rows
  end
end
