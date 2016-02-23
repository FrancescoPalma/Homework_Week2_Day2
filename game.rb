require_relative("turn_log")

class Game
  attr_reader :current_player, :winner, :log

  def initialize(players, board)
    @players = players
    @board = board
    @current_player = players[0]
    @winner = nil
    @log = []
  end

  def number_of_players
    return @players.count
  end

  def update_current_player
    @current_player = @players.rotate![0]
  end

  def next_turn(spaces)
    return if(is_won?)

    @current_player.move(spaces)

    modifier = @board.state[@current_player.position]

    @current_player.move(modifier)

    log << TurnLog.new(player: @current_player, roll: spaces, modifier: modifier)

    update_current_player
  end

  def is_won?
    for player in @players
      @winner = player if player.position == @board.win_tile
    end
    return @winner.nil? ? false : true
  end

end