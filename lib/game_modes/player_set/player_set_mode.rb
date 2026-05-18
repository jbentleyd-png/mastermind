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
    puts "Secret code is #{code}. Is this correct?"
    print 'Confirm (Y/N): '.green
    confirmation = force_y_n
    confirmation == 'Y'
  end

  def self.set_code
    puts "\n\nLet\'s play Mastermind! Create a four-color code (color repeats are possible).".blue
    puts "Possible inputs: #{ACCEPTABLE}"
    code = force_input
    code = force_input until confirm_input?(code)
  end

  def self.play_game
    code = set_code
    board = Board.new(code)
    board.display
  end
end
