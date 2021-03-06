require 'studio_game/game'

module StudioGame
  describe Game do
    before do
      @game = Game.new("Knuckleheads")
      @initial_health = 100
      @player = Player.new("moe", @initial_health)
      @game.add_player(@player)
    end

    it "w00ts on a high number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(5)
      @game.play(2)
      expect(@player.health).to eq(@initial_health + 15 * 2)
    end

    it "skips on a medium number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(3)
      die = Die.new
      puts "DREW: #{die.roll}"
      @game.play(2)
      expect(@player.health).to eq(@initial_health)
    end

    it "blams on a low number" do
      allow_any_instance_of(Die).to receive(:roll).and_return(1)
      @game.play(2)
      expect(@player.health).to eq(@initial_health - 10 * 2)
    end

    it "assigns a treasure for points during a player's turn" do
      game = Game.new("Knuckleheads")
      player = Player.new("moe")

      game.add_player(player)

      game.play(1)

      expect(player.points).not_to be_zero
    end
  end
end
