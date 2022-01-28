class AmazonUrlsController < ApplicationController
  before_action :set_amazon_url, only: %i[ show edit update destroy ]

  def index
    @q = AmazonUrl.all.ransack(params[:q])
    @pagy, @amazon_urls = pagy(@q.result)
  end

  def show; end

  def new
    @amazon_url = AmazonUrl.new
  end

  def edit; end

  def create
    @amazon_url = AmazonUrl.new(amazon_url_params)
    respond_to do |format|
      if @amazon_url.save
        format.html { redirect_to amazon_urls_path, notice: "Amazon url was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @amazon_url.update(amazon_url_params)
        format.html { redirect_to amazon_urls_path, notice: "Amazon url was successfully updated." }
      else
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @amazon_url.destroy
    respond_to do |format|
      format.html { redirect_to amazon_urls_path, notice: "Amazon url was successfully destroyed." }
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
