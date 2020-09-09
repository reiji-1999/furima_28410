class BuyersController < ApplicationController
  before_action :authenticate_user!
  # before_action :pay_item, only:[:index, :create]

  def index
    @item = Item.find(params[:item_id])
    redirect_to root_path if current_user.id == @item.user_id
    @buyermanagement = BuyerManagement.new
  end

  def create
    if params[:token] == nil
      redirect_to root_path
    else 
      @buyermanagement = BuyerManagement.new(buyer_params)
      if @buyermanagement.valid?
        pay_item
        @buyermanagement.save
        redirect_to root_path
      else
        render 'index'
      end
    end
  end


    private

  def buyer_params
    @item = Item.find(params[:item_id])
    params.permit(:postalcode, :area_id, :city, :housenumber, :buildingname, :phonenumber, :token).merge(user_id: current_user.id, item_id: @item.id)
  end

  def pay_item
    @item = Item.find(params[:item_id])
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: params[:token],
      currency: 'jpy'
    )
  end

end
