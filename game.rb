require_relative "player"

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
    puts "Welcome #{@player.name} 👋."
    sleep(2)
    puts "You are in front of my apartment, a sunny Sunday of May 2020, the door is half-open."
    sleep(2)
    puts "What do you want to do?"
    print "#{@player.name}: "
    answer = gets.chomp
    until answer.match?(/.*open.*door.*/i)
      puts "Hmm.. nothing happens."
      sleep(1)
      print "#{@player.name}: "
      answer = gets.chomp
    end
    puts "You're inside!"
  end

  def createPlayer
    puts "Hi there!"
    sleep(1)
    puts "What\'s you name?"
    name = gets.chomp
    @player.name = name
    sleep(1)
  end

  def outro

  end
end
