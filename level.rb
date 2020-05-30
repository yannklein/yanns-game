require 'json'

class Level
  attr_reader :name, :password

  def initialize(player)
    @name = name
    @password = password
    @player = player
    @levels = load_levels
    run_level({ level: 0, question: 0 })
  end

  def run_level(current)
    level_num = current[:level]
    question_num = current[:question]
    # Intro if first question
    if question_num == 0
      type_puts @levels['levels'][level_num]['intro']
      sleep(2)
    end
    # Ask question
    question_hash = @levels['questions'][question_num]
    type_puts question_hash['question']
    print "#{@player.name}: "
    answer = gets.chomp
    until answer.match?(Regexp.new(question_hash['response']['regex'], 'i'))
      type_puts question_hash['defaultResponse']
      sleep(1)
      print "#{@player.name}: "
      answer = gets.chomp
    end
    type_puts question_hash['response']['text']
    unless question_hash['response']['route'] == 'end'
      run_level(question_hash['response']['route'])
    else
      puts 'The end!'
    end
  end

  def load_levels
    filepath = 'levels.json'
    serialized_levels = File.read(filepath)
    JSON.parse(serialized_levels)
  end
end
