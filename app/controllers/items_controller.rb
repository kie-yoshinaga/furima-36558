class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  #before_action :move_to_index, only: [:create]

  def index
    
    @item = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:catch_copy,:category_id,:condition_id,:price,:postage_id,:prefecture_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  #def move_to_index
    #unless user_signed_in?
      #redirect_to new_user_session_path
    #end
  #end
end

