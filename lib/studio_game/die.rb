require_relative 'auditable'

module StudioGame
  class Die
    include Auditable
    attr_accessor :number

    def initialize
      @number
    end

    def roll
      @number = rand(1..6)
      audit
    end
  end
end
