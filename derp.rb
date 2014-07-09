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
      str = answer + wordpunct.to_s
      #@wordsswitched = @wordswitched + 1
    elsif pos.include?("verb")
      puts "Give me a verb"
      answer = gets.chomp
      str = answer + wordpunct.to_s
      #@wordsswitched = @wordswitched + 1
    elsif pos.include?("adjective")
      puts "Give me an adjective"
      answer = gets.chomp
      str = answer + wordpunct.to_s
      #@wordsswitched += 1
    elsif pos.include?("noun")
      puts "Give me a noun"
      answer = gets.chomp
      str = answer + wordpunct.to_s
      #@wordsswitched += 1
    else
      str
    end

  end

passage = "No one could have guessed."
array_test = passage.split

to_print = array_test.map do |word|
     wordexchange(word)
end

puts to_print.join(" ")