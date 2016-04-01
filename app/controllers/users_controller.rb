class UsersController < ApplicationController
  def new
  	@user=User.new
  end

 
 def show
    @user = User.find(params[:id])
 end

 def edit
    @user = User.find(params[:id])
  end
def index
  @user=User.all
end

 	def create
    @user = User.new(user_params)
    if @user.save
    	 log_in @user
  flash[:success] = "Welcome to the Forbes Film Article!"

      redirect_to @user
    else
      render 'new'
    end
  end

  def update
     @user = User.find(params[:id])
    if @user.update(user_params)
      
  flash[:success] = "User edited Successfully!"

      redirect_to @user
    else
      render 'edit'
    end
  end

def destroy
@user=User.find(params[:id])
@user.destroy
redirect_to users_path
end



   private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation,:image)
    end

  
end
