class OrderHistoriesController < ApplicationController
  before_action :move_to_index, expect: [:index,:new, :create]

  def index
    @order_history_address = OrderHistoryAddress.new
    @item = Item.find(params[:item_id])
    if current_user == @item.user
        redirect_to root_path
    end
    #redirect_to root_path unless current_user.id == @item.user_id
  end

  def new
    @order_history_address = OrderHistoryAddress.new
  end

  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @order_history_address = OrderHistoryAddress.new(order_history_address_params)
    if @order_history_address.valid?
      pay_item
      @order_history_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_history_address_params
    params.require(:order_history_address).permit(:image,:title,:price,:postal_code, :prefecture_id, :city, :house_number, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,  # 商品の値段
      card: order_history_address_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

  def move_to_index
    unless user_signed_in?
      redirect_to user_session_path
    end
  end

end
