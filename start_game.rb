#this function is currently not in working state -Brant 

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

test