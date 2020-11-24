class ItemsController < ApplicationController
  before_action :authenticate_user!, only:[:new, :edit ]
  before_action :find_item, only:[:show, :edit, :update, :destroy ]
  
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
    # @item = Item.find(params[:id]) // before_action で呼び出しているので記述不要
  end

  def edit
    if @item.user_id != current_user.id
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
        redirect_to item_path, method: :get
    else 
        render :edit
    end
  
  end

  def destroy
    if @item.destroy
      redirect_to root_path
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :explanation, :category_id, :condition_id, :postage_id, :prefecture_id,:arrival_date_id, :price, ).merge(user_id: current_user.id)
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
