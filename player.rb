class Player
  attr_accessor :name, :health, :score

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @score = @health + @name.length
  end

  def say_hello()
    "I'm #{@name} with a health of #{@health} and a score of #{@score}."
  end

  def time
    time = Time.new
    time.strftime("%H:%m:%S")
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{@score}."
  end

  def score
    @score = @health + @name.length
  end

  def w00t
    puts "#{@name} got w00ted!"
    @health += 15
    score
  end

  def blam
    puts "#{@name} got blammed!"
    @health -= 10
    score
  end

  def strong?
    @health > 100
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
