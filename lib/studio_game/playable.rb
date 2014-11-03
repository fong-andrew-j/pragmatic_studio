module StudioGame
  module Playable
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
  end
end
