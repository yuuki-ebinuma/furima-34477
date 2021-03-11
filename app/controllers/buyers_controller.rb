class BuyersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:index,:create]
  before_action :move_to_index, only: [:index,:edit]

  def index
    @buyers_address = BuyersAddress.new
  end

  def create
    @buyers_address = BuyersAddress.new(buyers_params)
    if @buyers_address.valid?
      pay_item
      @buyers_address.save
      redirect_to root_path
    else
      render :index
    end
  end


  private

  def buyers_params
    params.require(:buyers_address).permit(:postal_code,:ship_region,:ship_address,:ship_city_id,:building,:phone).merge(user_id: current_user.id,product_id: @product.id,token: params[:token])
  end

  def set_product
    @product = Product.find(params[:product_id])
  end


  def move_to_index
    if current_user.id == @product.user_id || @product.buyer.present?
      redirect_to root_path
    end
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @product.amount_sold,
        card: buyers_params[:token],
        currency: 'jpy'
      )
    end
end
