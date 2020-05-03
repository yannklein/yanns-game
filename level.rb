class Level
  attr_reader :name, :password

  def initialize(name, password, player)
    @name = name
    @password = password
    @player = player
  end

  def welcome
    "Dear "
  end
end
