class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new]
  before_action :move_to_index, only: [:edit]


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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    unless current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    #item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  private

  def item_params
    params.require(:item).permit(:image,:title,:catch_copy,:category_id,:condition_id,:price,:postage_id,:prefecture_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  def move_to_index
    unless user_signed_in?
      redirect_to root_path
    end
  end
end

