module ComputerPlay
  def self.make_a_guess
    guess_array = []
    4.times do
      guess_array.push ACCEPTABLE[rand(0..5)]
    end
    guess_array
  end
end
