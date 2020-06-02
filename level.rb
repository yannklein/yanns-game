require 'json'

class Level
  attr_reader :name, :password

  def initialize(player)
    @name = name
    @password = password
    @player = player
    @levels = load_levels
    run_level({ 'level' => 0, 'question' => 0, 'show_question' => true })
  end

  def run_level(current)
    level_num = current['level']
    question_num = current['question']
    show_question = current['show_question']
    # Intro if first question
    if question_num == 0 && show_question
      type_puts @levels['levels'][level_num]['intro']
      sleep(2)
    end
    # Ask question
    question_hash = @levels['questions'][question_num]
    type_puts question_hash['question'] if show_question
    print "#{@player.name}: "
    answer = gets.chomp
    show_default_response = true
    question_hash['response'].each do |response|
      if answer.match?(Regexp.new(response['regex'], 'i'))
        show_default_response = false
        type_puts response['text']
        if response['route']['question'] == 'end'
          type_puts "The end!\n\n\n\n\n"
        elsif @levels['questions'][response['route']['question']].nil?
          type_puts "Story to be continued..!\n\n\n\n\n"
        else
          run_level(response['route'])
        end
      end
    end
    if show_default_response
      type_puts question_hash['defaultResponse']
      sleep(1)
      run_level({ 'level' => level_num, 'question' => question_num, 'show_question' => false })
    end
  end

  def load_levels
    filepath = 'levels.json'
    serialized_levels = File.read(filepath)
    JSON.parse(serialized_levels)
  end
end
