require "wordnik"

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
  
    str = str + wordpunct
end






