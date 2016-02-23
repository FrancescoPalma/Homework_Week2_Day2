class Player
  attr_reader :name, :position

  def initialize(name, max_movement)
    @name = name
    @position = 0
    @max_movement = max_movement
  end

  def move(spaces)
    if (@position + spaces > @max_movement)
      @position = @max_movement
    else
      @position += spaces
    end
  end
end