class ItemsController < ApplicationController

  def index
    @item = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
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
end