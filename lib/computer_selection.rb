class ComputerSelection
  attr_reader :random_selection

  def initialize
    @random_selection = random_selection
  end

  def random_selection
    random_number = rand(3)
    return "Scissors" if random_number.zero?
    return "Rock" if random_number == 1
    return "Paper" if random_number == 2
  end

end
