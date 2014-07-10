require "wordnik"

Wordnik.configure do |config|
  config.api_key = '72f822a10caf5b76405070ac1070691e86b0ba82383543f4d'
end

derp = Wordnik.word.get_definitions("hello")
puts derp
