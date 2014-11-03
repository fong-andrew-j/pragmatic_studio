require_relative 'treasure_trove'
require_relative 'playable'

module StudioGame
  class Player
    include Playable

    attr_accessor :name, :health, :score

    def initialize(name, health=100)
      @name = name.capitalize
      @health = health
      @found_treasures = Hash.new(0)
      @score = score
    end

    def self.from_csv(line)
      name, health = line.split(',')
      Player.new(name, Integer(health))
    end

    def say_hello()
      "I'm #{@name} with a health of #{@health} and a score of #{@score}."
    end

    def time
      time = Time.new
      time.strftime("%H:%m:%S")
    end

    def to_s
      "I'm #{@name} with health = #{@health}, points = #{points}, and score = #{@score}."
    end

    def score
      @score = @health + points
    end

    def <=> other_player
      if self.score < other_player.score
        1
      elsif self.score > other_player.score
        -1
      else
        0
      end
    end

    def found_treasure(treasure)
      @found_treasures[treasure.name] += treasure.points
      score
      puts "#{@name} found a #{treasure.name} worth #{treasure.points} points!\n"
    end

    def points
      total = 0
      @found_treasures.each do |key, value|
        total += value
      end
      total
    end

    def each_found_treasure
      @found_treasures.each do | name, points |
        yield Treasure.new(name, points)
      end
    end

    if __FILE__ == $0
      player = Player.new("moe")
      puts player.name
      puts player.health
      player.w00t
      puts player.health
      player.blam
      puts player.health
    end
  end
end
