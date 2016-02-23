require 'minitest/autorun'
require 'minitest/rg'
require_relative '../player'

class TestPlayer < Minitest::Test

  def setup
    @player = Player.new("Val",8)
  end

  def test_player_has_a_name
    assert_equal("Val", @player.name)
  end

  def test_player_starts_at_tile_0
    assert_equal(0, @player.position)
  end

  def test_player_can_move
    @player.move(5)
    assert_equal(5, @player.position)
  end

  def test_player_cannot_move_past_maximum
    @player.move(15)
    assert_equal(8, @player.position)
  end
end