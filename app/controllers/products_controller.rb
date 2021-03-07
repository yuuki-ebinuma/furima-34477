class ProductsController < ApplicationController
  before_action :authenticate_user!,only: [:new,:delete,:create]

  def index
    @products = Product.all.order(updated_at: :desc)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end

  end



  private

  def product_params
    params.require(:product).permit(:image,:product_name,:product_description,:category_id,:ship_city_id,:ship_date_id,:ship_charge_id,:product_status_id,:amount_sold).merge(user_id: current_user.id)
  end
  
end
