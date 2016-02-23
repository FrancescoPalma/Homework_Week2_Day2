class TurnLog

  attr_reader :player, :roll, :modifier

  def initialize(params)
    @player = params[:player]
    @roll = params[:roll]
    @modifier = params[:modifier]
  end

  # This function explains the task of the 'modifier_type'. The variable 'result' equals to ':space' 
  # so, in this context, the '@modifer' is greater than 0 if the result will be set to ':ladder' 
  # which will make the player's position advance, otherwise the 'result' will be set to ':snake'
  # which will make the player's position go backwards.
  def modifier_type
    result = :space
    @modifier > 0 ? result = :ladder : result = :snake
    return result
  end
end