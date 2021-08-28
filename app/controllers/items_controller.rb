class ItemsController < ApplicationController

  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end


  private

  def message_params
    params.require(:message).permit(:content, :image).merge(user_id: current_user.id)
  end
  
end
