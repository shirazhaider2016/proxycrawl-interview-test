class Api::AmazonUrlsController < Api::ApplicationController
  before_action :set_amazon_url, only: %i[ show edit update destroy ]

  def index
    @q = AmazonUrl.all.ransack(params[:q])
    @pagy, @amazon_urls = pagy(@q.result)
  end

  def show; end

  def create
    @amazon_url = AmazonUrl.new(amazon_url_params)
    if @amazon_url.save
      render 'api/amazon_urls/show'
    else
      render json: { error: "Amazon url could not be created. #{@amazon_url.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    end
  end

  def update
    if @amazon_url.update(amazon_url_params)
      render 'api/amazon_urls/show'
    else
      render json: { error: "Amazon url could not be updates. #{@amazon_url.errors.full_messages.join(', ')}" }, status: :unprocessable_entity
    end
  end

  def destroy
    if @amazon_url.destroy
      render json: { message: 'Amazon url has been deleted successfully.' }, status: :ok
    else
      render json: { error: "Amazon url could not be deleted." }, status: :unprocessable_entity
    end
  end

  private

  def set_amazon_url
    @amazon_url = AmazonUrl.find(params[:id])
  end

  def amazon_url_params
    params.require(:amazon_url).permit(:url, :title)
  end
end
