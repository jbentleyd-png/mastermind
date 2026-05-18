module PlayerSetMode
  def self.input_allowed?(input)
    return false if input.length != 4

    input = input.chars
    difference_array = input - ACCEPTABLE
    difference_array.empty?
  end

  def self.force_input
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
      print 'Confirm (Y/N): '
      input = gets.chomp.upcase
    end
    input
  end

  def self.input_and_confirm?
    puts "Secret code is #{force_input}. Is this correct?"
    print 'Confirm (Y/N): '
    confirmation = force_y_n
    confirmation == 'Y'
  end

  def self.play_game
    puts "\n\nLet\'s play Mastermind! Create a four-color code (color repeats are possible).".blue
    puts "Possible inputs: #{ACCEPTABLE}"
    print "\nSecret Code: ".green
    if input_and_confirm?
      print "Let's play, then."
    else
      print 'Reinput.'
    end
  end
end
