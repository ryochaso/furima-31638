class OrdersController < ApplicationController
  before_action :find_item
  # before_action :find_item, only:[:index]
  before_action :authenticate_user!, only:[:index]

  def index
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    end
    # @oreder = Order.includes(:user, :item)

    @item_order = ItemOrder.new
  end
  
  # def new
  #   @item_order = ItemOrder.new
  # end
  
  def create
    
    # binding.pry
    
    @item_order = ItemOrder.new(order_params) 
    if @item_order.valid?
        @item_order.save
        redirect_to root_path
    else
      render action: :index
    end
  end
  
  private

  def order_params
    params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :buillding, :phone_number).merge(item_id: params[:item_id] , user_id: current_user.id)
    # params.require(:item_order).permit(:postal_code, :prefecture_id, :city, :house_number, :buillding, :phone_number)
  end

  def find_item
    @item = Item.find(params[:item_id])
  end

end