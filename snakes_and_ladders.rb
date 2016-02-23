require_relative 'game'
require_relative 'player'
require_relative 'board'
require_relative 'dice'
require_relative 'viewer'

# I don't understand why was it necessary to create a 'snake_and_ladders.rb' file.
class SnakeAndLadders

  def initialize(dice)
    @dice = dice

    positions = {
      2 => 4,
      7 => -7,
    }
    board = Board.new(9, positions)

    player1 = Player.new("Val",board.size)
    player2 = Player.new("Rick",board.size)

    players = [player1,player2]
    @game = Game.new(players,board)
  end

  # From line 27 to line 33 I understand this function has the main purpose to make the whole game
  # continuing and keeping the players rolling the dice until the game is won.
  # The return of the while loop is the parameter 'viewer' (i.e. the interaction on CLI) connected with
  # the log of the game that keeps registering each move.
  # Not sure I really understood the whole file though. Need to investigate in class.
  def simulate(viewer)
    while(!@game.is_won?)
      @game.next_turn(@dice.roll)
    end

    viewer.replay(@game.log)
  end

end

game = SnakeAndLadders.new(Dice.new)
game.simulate(Viewer.new)