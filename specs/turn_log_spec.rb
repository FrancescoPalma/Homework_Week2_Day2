require 'minitest/autorun'
require 'minitest/rg'
require_relative('../turn_log')

# I think the purpose of creating a 'TurnLog' class is to keep track of the movements of each player.
# By doing this, it is possible to make the 'log' be the one that control the flow of the game
# by setting what will happen to the player that rolls the dice and gets any number, 
# whether it will jump into a modifier (i.e. :snake or :ladder) or just a normale space.
class TestTurnLog < Minitest::Test

  # This setup sets three variables instance of three different 'turn_logs'. To each one of them is
  # assigned a new instance of 'TurnLog' with three parameters: player name, roll, and the modifier 
  # (which is the snake or ladder present inside the board that modify the position of the player). 
  def setup
    @turn_log1 = TurnLog.new(player: "Valerie", roll: 7, modifier: -7)
    @turn_log2 = TurnLog.new(player: "Rick", roll:2, modifier:4)
    @turn_log3 = TurnLog.new(player: "Valerie", roll:1, modifier:0)
  end

  # The first three tests have been set to test the actual presence as parameters in the 
  # 'initialize' method in 'turn_log.rb'.

  def test_has_player
    assert_equal("Valerie",@turn_log1.player)
  end

  def test_has_modifier
    assert_equal(-7,@turn_log1.modifier)
  end

  def test_has_roll
    assert_equal("Valerie",@turn_log1.player)
  end

  # The last three tests expect to return ':snake' when the roll result is '7' and its modifier
  # will be '-7', to return ':ladder' when the roll result is 2 and its modifier 4 and to return
  # ':space' when the roll is 1 and in this case there is no modifier.

  def test_has_snake_modifier_type
    assert_equal(:snake, @turn_log1.modifier_type)
  end

  def test_has_ladder_modifier_type
    assert_equal(:ladder, @turn_log2.modifier_type)
  end

  def has_space_modifier_type
    assert_equal(:space, @turn_log3.modifier_type)
  end
end