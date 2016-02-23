require 'minitest/autorun'
require 'minitest/rg'
require_relative '../game'
require_relative '../player'
require_relative '../board'

class TestGame < Minitest::Test

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

  def test_game_starts_with_2_players
    assert_equal(2, @game.number_of_players)
  end

  def test_game_current_player_starts_as_player_1
    assert_equal(@player1, @game.current_player)
  end

  def test_can_update_current_player
    @game.update_current_player
    assert_equal(@player2, @game.current_player)
  end

  def test_can_take_turn
    @game.next_turn(1)
    assert_equal(@player2,@game.current_player)
    assert_equal(1,@player1.position)
  end

  def test_can_take_turn_with_ladder
    @game.next_turn(2)
    assert_equal(@player2,@game.current_player)
    assert_equal(6,@player1.position)
  end

  def test_can_take_turn_with_snake
    @game.next_turn(7)
    assert_equal(@player2,@game.current_player)
    assert_equal(0,@player1.position)
  end

  # This test expects nil as result from passing the actual instance variable of game.
  # @winner will then be present in the initialize method in game.rb, line 10 with nil assigned as value.
  # I think the goal of this test is to set the winner to nil. Therefore, to 'nothing'.
  # In fact, when players start the game there isn't any winner yet.
  def winner_starts_as_nil
    assert_equal(nil,@game.winner)
  end

  # This test expects the game to be won if a player moves 8 spaces from its current position.
  def test_game_is_won
    @game.next_turn(8)
    assert_equal(true,@game.is_won?)
  end

  # This test shows that once player1 has moved 8 spaces the game is won so there is no 'next_turn'
  # for both players. In fact, in the second 'assert_equal' player2 is expected to return 0 as next move.
  def test_no_next_turn_on_win
    @game.next_turn(8)
    assert_equal(true,@game.is_won?)

    @game.next_turn(2)
    assert_equal(0,@player2.position)
  end

  # This test shows every time a player makes a move the log will store the 'size' of the move, 
  # the name of the player, the result from the roll and the new position.
  def test_adds_turn_to_log
    @game.next_turn(1)
    assert_equal(1,@game.log.size)
    assert_equal("Val",@game.log[0].player.name)
    assert_equal(1,@game.log[0].roll)
    assert_equal(0,@game.log[0].modifier)
  end
end

