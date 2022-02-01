class BooksController < ApplicationController
  before_action :set_book, only: %i[ show edit update destroy ]

  def index
    @books = Book.all
    render json: @books
  end

  def show
    render json: @book
  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.language = params[:book][:language]
    @book.author = params[:book][:author]
    @book.published = params[:book][:published]
    @book.excerpt = params[:book][:excerpt]

    if params[:book][:image]
      @book.image.attach(params[:book][:image])
    else
      @book.image.attach(io: File.open("./storage/default-images/default-image.png"), filename: 'default-image.png')
    end
    
    @book.save # will cause the blob path to update
    @book.image_url = Rails.application.routes.url_helpers.rails_blob_path(@book.image, only_path: true)

    if @book.save
      # do something on success
      render json: @book, status: :created
    else
      # do something on failure
      render json: @book.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /books/1
  def update
    @book.update(book_params) # will update everything but the image_url
    if params[:book][:image]
      @book.image_url = Rails.application.routes.url_helpers.rails_blob_path(@book.image, only_path: true)
      @book.save
    end
  
    if @book.errors.size > 0
      render json: @book.errors, status: :unprocessable_entity
    else
      render json: @book, status: :ok
    end
  end

  def destroy
    # add confirmation on the front end
    @book.destroy
    head :no_content
  end
 
 
  private 
  # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  def book_params
    params.require(:book).permit(
      :title,
      :language,
      :author,
      :published,
      :excerpt,
      :image_url, #remove this
      :image
    )
  end
end
