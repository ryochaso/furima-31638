class OrdersController < ApplicationController
  before_action :find_item
  before_action :authenticate_user!, only:[:index]

  def index
    if user_signed_in?
      if @item.user_id == current_user.id
        redirect_to root_path
      end
    end
    # @oreder = Order.includes(:user, :item)
  end
end

private

def find_item
  @item = Item.find(params[:item_id])
end