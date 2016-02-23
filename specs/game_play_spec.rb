require 'minitest/autorun'
require 'minitest/rg'
require_relative '../game'
require_relative '../player'
require_relative '../board'

# Probably the purpose of this class is to show three hypothetical paths.
# I am not 100% sure about why there isn't a 'game_play.rb' file. 
# I think there is no real need for this file because is already being connected with 'require_relative'
# to game, player and board files. In fact, in the 'setup' one can see that there are the players, 
# the positions, the board and the game initialized by creating instances of those classes with the
# '.new' constructor.
class TestGamePlay < Minitest::Test

  def setup
    positions = {
     2 => 4,
     7 => -7,
   }

   board = Board.new(9, positions)

   @player1 = Player.new("Val",board.win_tile)
   @player2 = Player.new("Rick",board.win_tile)

   players = [@player1, @player2]

   @game = Game.new(players, board)

  end

  # I think this series of tests has been set to show a possible path of the game.
  # In this case player2 can actually make just one roll moving to position 1
  # for player1 first rolls 6 and then 2 being the winner at the end.
  def test_simple_win

    @game.next_turn(6)
    assert_equal(6,@player1.position)

    @game.next_turn(1)
    assert_equal(1,@player2.position)

    @game.next_turn(2)
    assert_equal(8,@player1.position)
    
    assert_equal(true, @game.is_won?)
    assert_equal(@player1, @game.winner)

  end

  # These tests have been set to show another possible path of the game.
  # In this case, both player1 and player2 will roll 6 and move to position 6.
  # Then, player1 will roll 1 and jumping therefore into ':snake' that will make it return to position 0.
  # Finally, player2 will roll 2 and then will move to position 8 winning the game.
  def test_game_snake_win

    @game.next_turn(6)
    assert_equal(6,@player1.position)

    @game.next_turn(6)
    assert_equal(6,@player2.position)

    @game.next_turn(1)
    assert_equal(0,@player1.position)

    @game.next_turn(2)
    assert_equal(8,@player2.position)

    assert_equal(true, @game.is_won?)
    assert_equal(@player2, @game.winner)

  end

  # This is a third possible path of the game.
  # In this scenario if player1 rolls 2, it will jumpo into a ':ladder' which will push the player 
  # to position 6. Then, player2 will roll 1 and move to position 1 for there is no modifier there.
  # Finally, player1 will roll 2 and it will move to position 8 where will win the game.
  def test_game_ladder_win

    @game.next_turn(2)
    assert_equal(6,@player1.position)

    @game.next_turn(1)
    assert_equal(1,@player2.position)

    @game.next_turn(2)
    assert_equal(8,@player1.position)

    assert_equal(true, @game.is_won?)
    assert_equal(@player1, @game.winner)

  end

end