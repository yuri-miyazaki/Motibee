
         class User < ApplicationRecord
          devise :database_authenticatable, :registerable,
                 :recoverable, :rememberable, :validatable
                   has_many :tweets
          has_many :tweets, dependent: :destroy
          
          validates :profile, length: { maximum: 200 } 
          has_many :likes, dependent: :destroy
          has_many :liked_tweets, through: :likes, source: :tweet
          has_many :comments, dependent: :destroy
          def already_liked?(tweet)
            self.likes.exists?(tweet_id: tweet.id)
          end
      end

