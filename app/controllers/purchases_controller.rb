class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :sold_confirmation, only: [:index, :create]
  before_action :contributor_confirmation, only: [:index, :create]

  def index
    @item = Item.find(params[:item_id])
    @purchase_delivery_address = PurchaseDeliveryAddress.new
  end

  def create
    @item = Item.find(params[:item_id])
    @purchase_delivery_address = PurchaseDeliveryAddress.new(purchase_params)
    if @purchase_delivery_address.valid?
      pay_item
      @purchase_delivery_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_delivery_address).permit(:postal_code, :prefecture_id, :municipalities, :house_number, :building_name, :telephone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: @purchase_delivery_address.token,
      currency: 'jpy'
    )
  end

  def sold_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if @item.purchase.present?
  end

  def contributor_confirmation
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user == @item.user
  end
end
