require_relative("turn_log")

class Game
  # the objective of this line is to communicate to another person reading the code that 
  # it is possible to see but not to modify the following variables wich are written below as symbols.
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

    # In this line a new instance of TurnLog is being created 
    # with three parameters: player,roll,modifier.
    log << TurnLog.new(player: @current_player, roll: spaces, modifier: modifier)

    update_current_player
  end

  # This function shows the loop of the two players and assigns one of the two players to @winner
  # if the current position is set equal to @board.win_tile, so to 8.
  # Finally, the for loop returns the @winner. I think the method '.nil?' is an additional check 
  # for that method returns true only if the object is nil.
  def is_won?
    for player in @players
      @winner = player if player.position == @board.win_tile
    end
    return @winner.nil? ? false : true
  end

end