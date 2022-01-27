class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]

  def index
    render json: Product.all
    # head 200
    # render js: "alert('Hello Rails');"
    # render html: "<h1>Hello World</h1>"
    # render plain: "OK"
    # redirect_to "/" #returns home
  end

  def show
    render json: @product
  end

  def create
    @product = Product.new({
      title: params[:title],
      description: params[:description],
      image_url: params[:image_url],
      price: params[:price]
    })

    if @product.save
      # do something on success
      render json: @product, status: :created
    else
      # do something on failure
      render json: @product.errors, status: :unprocessable_entity
    end
  end

  private 
  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, :description, :image_url, :price, :image)
  end
end
