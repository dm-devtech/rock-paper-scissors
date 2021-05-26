class Game
  attr_reader :result, :comp_selection, :player2_name

  def initialize(player1_turn, player2_turn, player1_name, player2_name = "Computer")
    @player1_turn = player1_turn
    @player2_turn = player2_turn
    @player1_name = player1_name
    @player2_name = player2_name
  end

  def result
    return "#{@player2_name} wins" if @player1_turn == "Rock" && @player2_turn == "Paper"
    return "#{@player2_name} wins" if @player1_turn == "Paper" && @player2_turn == "Scissors"
    return "#{@player2_name} wins" if @player1_turn == "Scissors" && @player2_turn == "Rock"
    return "#{@player1_name} wins" if @player2_turn == "Rock" && @player1_turn == "Paper"
    return "#{@player1_name} wins" if @player2_turn == "Paper" && @player1_turn == "Scissors"
    return "#{@player1_name} wins" if @player2_turn == "Scissors" && @player1_turn == "Rock"
    return "It is a Draw!" if @player1_turn == @player2_turn
  end
end
