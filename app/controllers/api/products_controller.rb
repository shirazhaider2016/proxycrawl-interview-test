class Api::ProductsController < Api::ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    @q = Product.all.ransack(params[:q])
    @pagy, @products = pagy(@q.result)
  end

  def show; end

  def create
    @product = Product.new(product_params)
    if @product.save
      render 'api/products/show'
    else
      render json: { error: "Product could not be created. #{@product.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    end
  end

  def update
    if @product.update(product_params)
      render 'api/products/show'
    else
      render json: { error: "Product could not be updated. #{@product.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.destroy
      render json: { message: 'Product has been deleted successfully.' }, status: :ok
    else
      render json: { error: "Product could not be deleted." }, status: :unprocessable_entity
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :image_url, :price, :currency_symbol, :customer_review, :review_count, :asin)
  end
end
