require_relative 'game'
require_relative 'player'
require_relative 'clumsy_player'
require_relative 'berserk_player'

player1 = Player.new("Moe", 100)
player2 = Player.new("Curly", 60)
player3 = Player.new("Larry", 125)

game = Game.new("Knuckleheads")
game.load_players(ARGV.shift || "/home/drusolis/Documents/pragstudio/studio_game/players.csv")
game.add_player(ClumsyPlayer.new("Bozo", 75))
game.add_player(BerserkPlayer.new("Spartan", 100))

loop do
  puts "How many games do you want to play? (enter 'quit' to quit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    game.play(Integer(answer))
  when 'quit', 'exit'
    game.print_stats()
    game.high_scores()
    game.save_high_scores()
    break
  else
    puts "Please enter a number or 'quit'"
  end
end
