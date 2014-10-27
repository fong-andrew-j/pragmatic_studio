require_relative 'game'
require_relative 'player'

player1 = Player.new("Moe", 100)
player2 = Player.new("Curly", 60)
player3 = Player.new("Larry", 125)

game = Game.new("Knuckleheads")
game.add_player(player1)
game.add_player(player2)
game.add_player(player3)
game.play(2)
game.print_stats()
game.high_scores()
