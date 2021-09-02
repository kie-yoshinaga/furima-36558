class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :new, :edit, :update, :destroy]
  before_action :set_message, only: [:show, :edit, :update, :destroy ]
  before_action :redirect_root, only: [:edit, :update, :destroy ]
  


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
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

  private

  def redirect_root
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def item_params
    params.require(:item).permit(:image,:title,:catch_copy,:category_id,:condition_id,:price,:postage_id,:prefecture_id,:shipping_date_id).merge(user_id: current_user.id)
  end

  def set_message
    @item = Item.find(params[:id])
  end

end