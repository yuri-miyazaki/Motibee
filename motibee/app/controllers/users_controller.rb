class UsersController < ApplicationController
 
    def show
      @user = User.find(params[:id]) 
    end


   
 

  def index
      @users = User.all
  end

  private
    def user_admin
       @users = User.all
       if  current_user.admin == false
           redirect_to root_path
       else
           render action: "index"
       end
    end

    private
    def tweet_params
      params.require(:tweet).permit(:body, :image) 
    end

end

