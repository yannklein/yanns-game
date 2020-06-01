require_relative "player"
require_relative "typer"
require_relative "level"

class Game
  def initialize
    @player = Player.new("")
  end

  def run
    intro
  end

  def intro
    puts "     __  __                 _
     \\ \\/ /___ _____  ____ ( )_____   ____ _____ _____ ___  ___
      \\  / __ `/ __ \\/ __ \\|// ___/  / __ `/ __ `/ __ `__ \\/ _ \\
      / / /_/ / / / / / / / (__  )  / /_/ / /_/ / / / / / /  __/
     /_/\\__,_/_/ /_/_/ /_/ /____/   \\__, /\\__,_/_/ /_/ /_/\\___/
                                   /____/

     A voyage through psyche, space and time of an individual."
    puts
    sleep(3)
    createPlayer

    type_puts "Welcome #{@player.name} 👋."
    sleep(2)

    Level.new(@player)
  end

  def createPlayer
    type_puts "Hi there!"
    sleep(1)
    type_puts "What\'s your name?"
    name = gets.chomp
    @player.name = name
    puts
    sleep(1)
  end

  def outro

  end
end
