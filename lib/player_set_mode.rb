module PlayerSetMode
  def self.input_allowed?(input)
    return false if input.length != 4

    input = input.chars
    difference_array = input - ACCEPTABLE
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

  def self.play_game
    puts "\n\nLet\'s play Mastermind! Create a four-color code (color repeats are possible).".blue
    puts "Possible inputs: #{ACCEPTABLE}"
    print "\nSecret Code: ".green
  end
end
