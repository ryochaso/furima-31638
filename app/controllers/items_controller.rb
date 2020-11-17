class ItemsController < ApplicationController
  def index
  end

  def new
  end
  

  # plrivate

  # def item_params
  #   params.require(:item).permit(:image, :name, :explanation,:category_id, :condition_id, :postage_id, :arrival_date_id, :price, :user).merge(user_id: current_user.id)
  # end

end
