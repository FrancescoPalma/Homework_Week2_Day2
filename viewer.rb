# This is supposed to be the class that shows an interaction with the user on the Command-Line.
class Viewer

  # This functions show mainly three actions, 1) it prints out every move of each player. 
  # 2) if the roll of a player hits a modifier, then its new position will be changed 
  # according to the modifier's nature. 3) It prints out the final winner.
  def replay(log)
    for item in log
      puts "#{item.player.name} rolled #{item.roll}"
      if(item.modifier != 0)
        puts "#{item.player.name} hit a #{item.modifier_type}! Moves #{item.modifier}"
      end
    end
    puts "The winner is #{item.player.name}"
  end
  
end