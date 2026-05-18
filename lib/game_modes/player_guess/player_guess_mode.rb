module PlayerGuessMode
  def self.input_allowed?(input, allowed)
    return false if input.length != 4

    input = input.chars
    difference_array = input - allowed
    difference_array.empty?
  end

  def self.force_input
    input = gets.chomp.upcase
    until input_allowed?(input, ACCEPTABLE)
      puts "Please input 4 of the following: #{ACCEPTABLE}"
      print 'Guess: '
      input = gets.chomp.upcase
    end
    input
  end

  def self.guess_input(round_number)
    prompt = round_number < 10 ? "##{round_number}: " : "##{round_number}:"
    print prompt
    force_input.chars
  end

  def self.play_round(board, round_number)
    guess_array = guess_input(round_number)
    board.add_row(guess_array)
    board.display
  end

  def self.display_result(code)
    if code.solved == true
      puts 'YOU DID IT! YOU ARE THE CHOSEN ONE!'.blue
    else
      code_output = Colorable.colorify_outside_string(code.pegs.join(''))
      print 'You FAIL. Code was '.red
      print "'#{code_output}'"
      puts '.'.red
    end
  end

  def self.play_game
    code = Code.new('guess_mode')
    board = Board.new(code, 'guess_mode')
    board.display
    puts 'Let\'s play Mastermind! Try to guess the four-color code (color repeats are possible).'
    (1..12).each do |round_number|
      play_round(board, round_number)
      break if code.solved == true
    end
    display_result(code)
  end
end
