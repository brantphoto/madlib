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