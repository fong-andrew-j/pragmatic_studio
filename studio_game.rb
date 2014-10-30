require_relative 'game'
require_relative 'player'

player1 = Player.new("Moe", 100)
player2 = Player.new("Curly", 60)
player3 = Player.new("Larry", 125)

game = Game.new("Knuckleheads")
game.add_player(player1)
game.add_player(player2)
game.add_player(player3)

loop do
  puts "How many games do you want to play? (enter 'quit' to quit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game.play(Integer(answer))
  when 'quit', 'exit'
    game.print_stats()
    game.high_scores()
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
