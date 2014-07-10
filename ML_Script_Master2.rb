#this program, which is a madlim game, is not complete and does not work

require "wordnik"

class Madlib_session

  #:attr_reader :madlib, :author

  def initialize(madlib, username, wordsswitched, game_counter,new_user_response)  
    @madlib = madlib  
    @username = username
    @username = ""
    @wordsswitched = 0
    @game_counter = 0
    @new_user_response
  end
  def madlib
  	@madlib
  end
  def username
  	@username
  end
  def wordsswitched
  	@wordsswitched
  end
  def new_user_response
    @new_user_response
  end

  def want_to_play
    begin
      ask_name
      get_passage
      put_together

      puts "Would you like to play again"
      answer = gets.chomp
      puts ""
      answer = answer.downcase

    end while answer == "y"
    puts "Goodbye!"
  end

  def get_passage
    puts "Please paste a passage you would like to use to play this game, #{@username}."
    @madlib = gets.chomp
    to_delete = @madlib.include?("\"")
    if to_delete
      @madlib = @madlib.delete("\"")
    end
    if @madlib.split.size < 5
      puts "please provide longer passage"
      get_passage
    end
    @madlib
  end

  def ask_name
    if !@username.blank?
      puts "Are you still #{@username}?"
      same_user = gets.chomp.downcase
      if same_user[0] != "y"
        @username = nil
      end
    end
    while @username.blank? 
      puts "What is your name?"
      @username = gets.chomp
    end
  end

#   def new_user_check
#   puts "new user? Y/N"
#   answer = gets.chomp
#   answer = answer.downcase
#   if answer == "y" #checks to see if the user has already input name in previous round of game
#     ask_name
#   elsif answer == "n"
#     puts "welcome back #{@username}"
#   else
#     puts "please type either Y or N"
#     new_user_check
#   end
# end

  def splitter(str)
    @madlib = str.split
  end

  def joiner(array)
    @madlib = array.join
    puts new_passage.join(" ")
  end

  def wordexchange(str)
    sampleword = str.scan(/([A-Za-z]*)[\.\,\;\:\?\%]/)
    if sampleword[0] == nil
      sampleword = str
    else
      sampleword = sampleword[0].to_s.delete!('[""]')
    end

    wordpunct = str.scan(/[A-Za-z]*([\.\,\;\:\?\%])/) 
    if wordpunct == nil 
      wordpunct = ""
    else
      wordpunct = wordpunct[0].to_s.delete!('[""]')
    end

    Wordnik.configure do |config|
      config.api_key = '72f822a10caf5b76405070ac1070691e86b0ba82383543f4d'
    end

    wordnik_json = Wordnik.word.get_definitions(sampleword)
    word_through_dictionary = wordnik_json[0]
    part_of_speech = word_through_dictionary["partOfSpeech"]
    #puts part_of_speech
    
    if part_of_speech.include?("adverb")
      @wordsswitched += 1
      puts "Give me an adverb"
      answer = gets.chomp
      str = answer + wordpunct.to_s
    elsif part_of_speech.include?("verb")
      @wordsswitched += 1
      puts "Give me a verb"
      answer = gets.chomp
      str = answer + wordpunct.to_s
    elsif part_of_speech.include?("adjective")
      @wordsswitched += 1
      puts "Give me an adjective"
      answer = gets.chomp
      str = answer + wordpunct.to_s
    elsif part_of_speech.include?("noun")
      @wordsswitched += 1
      puts "Give me a noun"
      answer = gets.chomp
      str = answer + wordpunct.to_s
    else
      str
    end
  end

  def put_together
    new_passage = []
    @madlib.split.each do |word|
      if word.length > 4
        new_passage << wordexchange(word)
      else
        new_passage << word
      end
    end
  puts new_passage.join(" ")
  @game_counter += 1
  want_to_play
  end
end

session = Madlib_session.new("", "", 0, 0,"").want_to_play

