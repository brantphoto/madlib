def new_user_check
  #@username = ""
  puts "new user? Y/N"
  answer = gets.chomp
  answer = answer.downcase
  if answer == "y" #checks to see if the user has already input name in previous round of game
    ask_name
  elsif answer == "n"
    puts "welcome back #{@username}"
  else
    puts "please type either Y or N"
    new_user_check
  end
end
