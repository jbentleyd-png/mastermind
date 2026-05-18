module PlayerSetMode
  def self.input_allowed?(input)
    return false if input.length != 4

    input = input.chars
    difference_array = input - ACCEPTABLE
    difference_array.empty?
  end

  def self.force_input
    print "\nSecret Code: ".green
    input = gets.chomp.upcase
    until input_allowed?(input)
      puts "Please input 4 of the following: #{ACCEPTABLE}"
      print 'Secret Code: '.green
      input = gets.chomp.upcase
    end
    input
  end

  def self.y_n?(confirm_input) = %w[Y N].include?(confirm_input)

  def self.force_y_n
    input = gets.chomp.upcase
    until y_n?(input)
      print 'Confirm (Y/N): '.green
      input = gets.chomp.upcase
    end
    input
  end

  def self.confirm_input?(code)
    colored_code = Colorable.colorify_outside_string(code)
    puts "Secret code is #{colored_code}. Is this correct?"
    print 'Confirm (Y/N): '.green
    confirmation = force_y_n
    confirmation == 'Y'
  end

  def self.set_code
    puts "\n\nLet\'s play Mastermind! Create a four-color code (color repeats are possible).".blue
    puts "Possible inputs: #{ACCEPTABLE}"
    code = force_input
    code = force_input until confirm_input?(code)
    code.chars
  end

  def self.guess_input(round_number)
    prompt = round_number < 10 ? "##{round_number}: " : "##{round_number}:"
    guess_array = ComputerPlay.make_a_guess
    print prompt
    print guess_array
    guess_array
  end

  def self.play_round(board, round_number)
    guess_array = guess_input(round_number)
    board.add_row(guess_array)
    board.display
  end

  def self.display_result(code)
    if code.solved == true
      puts 'YOU LOSE! Computer guessed your code!'.red
    else
      puts 'YOU WIN! Computer did not guess your code!'.blue
    end
  end

  def self.play_game
    code = Code.new(set_code)
    board = Board.new(code, 'set_mode')
    board.display
    (1..12).each do |round_number|
      play_round(board, round_number)
      break if code.solved == true
    end
    display_result(code)
  end
end
