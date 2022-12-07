class TweetsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @tweets = Tweet.all
  end

end