class Die
  attr_accessor :number

  def initialize
    roll
  end
  
  def roll
    @number = rand(1..6)
  end
end
