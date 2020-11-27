class OrdersController < ApplicationController
  before_action :find_item
  before_action :move_to_top
  before_action :authenticate_user!, only:[:index]

  def index
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    end

    @item_order = ItemOrder.new
  end
  
  def create
    @item_order = ItemOrder.new(order_params) 
    if @item_order.valid?
      pay_item
      @item_order.save
        redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :buillding, :phone_number).merge(
    token: params[:token], item_id: params[:item_id] , user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
      Payjp.api_key =  ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: order_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
      )
  end

  def move_to_top
    unless @item.order == nil
      redirect_to root_path
    end
  end

end