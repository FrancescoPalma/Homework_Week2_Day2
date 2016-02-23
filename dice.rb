# From what I understood in class is that randomness is hard to test.
# So, I am not surprised to see no 'dice_spec.rb' file.
class Dice

  # I am not sure to understand this 'initialize' method. 
  # Why to put a range that goes from 1 to 4 and not from 1 to 8?
  def initialize
    @rolls = (1..4).to_a
  end

  # What is the method '.sample'? Is it just a way to show an 'example' of a roll?
  def roll
    return @rolls.sample
  end
  
end