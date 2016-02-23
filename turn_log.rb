class TurnLog

  attr_reader :player, :roll, :modifier

  def initialize(params)
    @player = params[:player]
    @roll = params[:roll]
    @modifier = params[:modifier]
  end

  def modifier_type
    result = :space
    @modifier > 0 ? result = :ladder : result = :snake
    return result
  end
end