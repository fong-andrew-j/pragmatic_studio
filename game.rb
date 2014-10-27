require_relative 'player'
require_relative 'die'
require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :name

  def initialize(name)
    @player = []
    @name = name
  end

  def add_player(player)
    @player << player
  end

  def play(rounds)
    puts "There are #{@player.size} players in #{@name}:"
    treasure = TreasureTrove::TREASURES
    puts "There are #{TreasureTrove::TREASURES.size} treasures to be found."
    treasure.each do | t |
      puts "A #{t.name} is worth #{t.points}"
    end
    1.upto(rounds) do | round |
      puts "Round: #{round}"
      @player.each do | player |
        puts player
        GameTurn.take_turn(player)
        puts player
      end
      puts "\n"
    end
  end
  
  def print_stats
    @player.each do | player |
      puts "#{player.name}'s point totals:"
      puts "#{player.score} grand total points"
      
      player.each_found_treasure do | treasure |
        puts "#{treasure.points} total #{treasure.name} points"
      end
    end
    
    puts "#{:name} Statistics"
    strong, weak = @player.partition { |player| player.strong? }
    
    puts "#{strong.count} strong players:"
    strong.each do | player |
      puts "#{player.name} (#{player.health})"
    end
    
    puts "#{weak.count} weak players:"
    weak.each do | player |
      puts "#{player.name} (#{player.health})"    
    end    
  end
  
  def high_scores
    puts "#{@name} High Scores:"
    @player.sort.each do | player |
      puts "#{player.name.ljust(30, '.')} #{player.score}"
    end
  end
end
