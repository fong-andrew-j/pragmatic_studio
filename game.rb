require_relative 'player'
require_relative 'die'
require_relative 'game_turn'

class Game
  attr_reader :name

  def initialize(name)
    @player = []
  end

  def add_player(player)
    @player << player
  end

  def play(rounds)
    puts "There are #{@player.size} players in #{:name}:"
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
