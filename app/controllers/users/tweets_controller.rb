class Users::TweetsController < ApplicationController
    before_action :set_tweet, only: %i[ show edit update destroy ]
    # skip_before_action :authenticate_user!, only: [:all_tweets]

    def index
        @tweets = current_user.tweets.all
    end

    # def all_tweets
    #   @tweets = Tweet.all
    # end

    def new
        @tweet = current_user.tweets.new
    end

    def create
      @tweet = current_user.tweets.new(tweet_params)
      respond_to do |format|
        if @tweet.save
          format.html { redirect_to users_tweet_path(current_user), notice: "Tweet was successfully created." }
          format.json { render :show, status: :created, location: @tweet }
        else
          format.html { render :new, status: :unprocessable_entity }
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
      end
    end
    
    def show
        @tweet = current_user.tweets.find(params[:id])
    end

    def edit
        @tweets = current_user.tweets.find(params[:id])
    end

    def update
     respond_to do |format|
          if @tweet.update(update_params)
              format.html { redirect_to  users_tweets_path(current_user), notice: "Tweet was successfully updated." }
              format.json { render :show, status: :ok, location: @tweet }
          else
              format.html { render :edit, status: :unprocessable_entity }
              format.json { render json: @tweet.errors, status: :unprocessable_entity }
          end
       end
    end

    def destroy
        @tweet.destroy

        respond_to do |format|
            format.html { redirect_to users_tweets_path(@user), notice: "Tweet was successfully destroyed." }
            format.json { head :no_content }
        end
    end

    private
      
      def set_tweet
        @tweet = current_user.tweets.find(params[:id])
      end
      
      def tweet_params
        params.require(:tweet).permit(:title, :description)
      end

      def update_params
        params.require(:tweet).permit(:title, :description)
      end
end