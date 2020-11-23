class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit, :update]
  
  def index
   @items = Item.includes(:user).order("created_at DESC")
    # @items = Item.all.order("created_at DESC") n1問題が懸念されるため
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

  def show
    @item = Item.find(params[:id])
  end

  def edit
    @item = Item.find(params[:id])
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    @item = Item.find(params[:id])
    @item.update(item_params)
    if @item.save 
        redirect_to item_path, method: :get
    else 
        render :edit
    end
  
  end


  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,:arrival_date_id, :price, ).merge(user_id: current_user.id)
  end

end
