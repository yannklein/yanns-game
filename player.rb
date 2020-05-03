class Player
  attr_accessor :name, :inventory

  def initialize(name)
    @name = name
    @inventory = []
  end
end
