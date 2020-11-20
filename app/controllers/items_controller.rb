class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new]
  
  def index
    # @items = @item.includes(:user).order("created at DESC")
    @items = Item.all.order("created_at DESC")
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
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,:arrival_date_id, :price, ).merge(user_id: current_user.id)
  end

end
