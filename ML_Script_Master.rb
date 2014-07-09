#this program, which is a madlim game, is not complete and does not work

require "wordnik"

class Madlib_session

  #:attr_reader :madlib, :author

  def initialize(madlib, author)  
    @madlib = madlib  
    @username = username
    @wordsswitched = 0
    @game_counter
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
    puts "Would you like to start a new game? Y/N"
    answer = gets.chomp
    puts ""
    answer = answer.downcase
    if answer == "y" 
      get_passage
    elsif answer == "n"
      abort
    else
      want_to_play
    end
  end

  def get_passage
    @user_name = "Kaitlin"
    puts "Please paste a passage you would like to use to play this game, #{@user_name}."
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
  
  def fetch_name
    puts "new user? Y/N"
    answer = gets.chomp
    new_user_response = answer.downcase!
    if @username == "" or new_user_response == "y" #checks to see if the user has already input name in previous round of game
        puts "What is your name?"
        @username = gets.chomp
    end
  end

  def splitter(str)
    @madlib = str.split
  end

  def joiner(array)
    @madlib = array.join
  end

def wordexchange(array)
  array.each do |i|
    sampleword = i.scan(/([A-Za-z]*)[\.\,\;\:\?\%]/)
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

    derp = Wordnik.word.get_definitions(sampleword)
    derp2 = derp[0]
    pos = derp2["partOfSpeech"]
    puts "#{pos}"

    if pos.include?("adverb")
      puts "Give me an adverb"
      answer = gets.chomp
      str = answer 
      #@wordsswitched = @wordswitched + 1
    elsif pos.include?("verb")
      puts "Give me a verb"
      str = gets.chomp
      #@wordsswitched = @wordswitched + 1
    elsif pos.include?("adjective")
      puts "Give me an adjective"
      str = gets.chomp
      #@wordsswitched += 1
    elsif pos.include?("noun")
      puts "Give me a noun"
      str = gets.chomp
      #@wordsswitched += 1
    else
      puts "next word"
    end
  end
  
    str = str + wordpunct
end








