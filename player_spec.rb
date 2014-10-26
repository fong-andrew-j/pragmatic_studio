require_relative 'player'

describe Player do
  before do
    @initial_health = 150
    @player = Player.new("moe", @initial_health)
  end

  it "has a capitalized name" do
    expect(@player.name).to eq("Moe")
  end

  it "has a string representation" do
    expect(@player.to_s).to eq("I'm #{@player.name} with a health of #{@player.health} and a score of #{@player.score}.")
  end

  it "computes a score as the sum of the health and name length" do
    expect(@player.score).to eq(@player.health + @player.name.size)
  end

  it "increases health by 15 when w00ted" do
    @player.w00t
    expect(@player.health).to eq(@initial_health + 15)
  end

  it "decreases health by 10 when blammed" do
    @player.blam
    expect(@player.health).to eq(@initial_health -10)
  end

  it "is strong if the health is >= 100" do
    expect(@player.strong?).to eq(true)
  end

  context "has initial health" do
    before do
      @player = Player.new("moe")
    end

    it "has an initial health" do
      expect(@player.health).to eq(100)
    end

    it "is weak" do
      expect(@player).not_to be_strong
    end
  end

  context "in a collection of players" do
    before do
      @player1 = Player.new("moe", 100)
      @player2 = Player.new("larry", 200)
      @player3 = Player.new("curly", 300)
  
      @players = [@player1, @player2, @player3]
    end
    
    it "is sorted by decreasing score" do
      puts @players
      expect(@players.sort).to eq([@player3, @player2, @player1])
    end
  end
  
  if __FILE__ != $0
    $stdout = StringIO.new
  end

end
