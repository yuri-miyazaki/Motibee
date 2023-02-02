class TweetsController < ApplicationController
  
  def index
    if params[:search] == nil
        @tweets= Tweet.all.page(params[:page]).per(5)
    elsif params[:search] == ''
        @tweets= Tweet.all.page(params[:page]).per(5)
    else
         @tweets = Tweet.where("body LIKE ? ",'%' + params[:search] + '%')
    end
end
        
        def index
          @tweets = Tweet.all.page(params[:page]).per(5)
       end

        def new
          @tweet = Tweet.new
        end
      

          def show
            @tweet = Tweet.find(params[:id])
            @comments = @tweet.comments
            @comment = Comment.new
          end
          def edit
            @tweet = Tweet.find(params[:id])
          end
          def update
            tweet = Tweet.find(params[:id])
            if tweet.update(tweet_params)
              redirect_to :action => "show", :id => tweet.id
            else
              redirect_to :action => "new"
            end
          end
          def destroy
            tweet = Tweet.find(params[:id])
            tweet.destroy
            redirect_to action: :index
          end
          def create
            tweet = Tweet.new(tweet_params)
            tweet.user_id = current_user.id
            if tweet.save!
              redirect_to :action => "index"
            else
              redirect_to :action => "new"
            end
          end

          def tweet_params
            params.require(:tweet)
          end

          def news
            @user = User.find(params[:id])
        end
          private
          def tweet_params
            params.require(:tweet).permit(:body, :image) 
          end

        
    


end


      
    



