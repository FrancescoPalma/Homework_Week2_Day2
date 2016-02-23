class Player
  attr_reader :name, :position

  def initialize(name, max_movement)
    @name = name
    @position = 0
    @max_movement = max_movement
  end

  # In this function the for loop is used to return the final '@position' of the player set to the 
  # 'spaces' parameter we passed in the 'move' function according to the test of the '@max_movement'
  # which has been initialized in the 'initialize' method.
  def move(spaces)
    if (@position + spaces > @max_movement)
      @position = @max_movement
    else
      @position += spaces
    end
  end
end