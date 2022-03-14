class UsersController < ApplicationController
    before_action :set_user, only: %i[ show edit update destroy ]
      
    def index
        @users = User.order(:name)
        render json: @users
    end
      
    def show
        render json: @user
    end

    def new
        @user = User.new
    end
    
    def create
        @user = User.new(user_params)
        
        if @user.save
            render json: @user
        else
            # there is not nessesarily a validation error in the case that the record cannot be saved...
            # What can you do to better protect against such an instance?
            render json: @user.errors.full_messages, status: :unprocessable_entity
        end
    end
        # def edit

        # end
      
        # # PATCH/PUT /books/1
        # def update
        #   @book.update(book_params) # will update everything but the image_url
        #   if params[:book][:image]
        #     @book.image_url = Rails.application.routes.url_helpers.rails_blob_path(@book.image, only_path: true)
        #     @book.save
        #   end
        
        #   if @book.errors.size > 0
        #     render json: @book.errors, status: :unprocessable_entity
        #   else
        #     render json: @book, status: :ok
        #   end
        # end
      
        # def destroy
        #   # add confirmation on the front end
        #   @book.destroy
        #   head :no_content
        # end
    
    private 
        def set_user
            @user = User.find(params[:id])
        end

        def user_params
            params.require(:user).permit(:name, :email, :password, :password_confirmation)
        end
end