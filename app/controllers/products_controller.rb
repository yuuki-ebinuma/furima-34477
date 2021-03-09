class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  before_action :set_product, only:[:show,:edit,:update,:destroy]
  before_action :move_to_index, only:[:edit,:update,:destroy]

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

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
  end



  private

  def product_params
    params.require(:product).permit(:image,:product_name,:product_description,:category_id,:ship_city_id,:ship_date_id,:ship_charge_id,:product_status_id,:amount_sold).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def move_to_index
    if current_user.id != @product.user_id
      redirect_to root_path
    end
  end
  
end
