class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id, :lead_time_id, :price, :image)
  end
end
