class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :destroy]
  before_action :contributor_confirmation, only: [:edit, :destroy]
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  before_action :sold_confirmation, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id)
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(:title, :explanation, :category_id, :condition_id, :delivery_fee_id, :prefecture_id,
                                 :lead_time_id, :price, { images: [] }).merge(user_id: current_user.id)
  end

  def contributor_confirmation
    item = Item.find(params[:id])
    redirect_to root_path unless current_user == item.user
  end

  def set_item
    @item = Item.find(params[:id])
  end

  def sold_confirmation
    redirect_to root_path if @item.purchase.present?
  end
end
