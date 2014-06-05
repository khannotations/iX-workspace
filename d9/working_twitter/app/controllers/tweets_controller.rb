class TweetsController < ApplicationController
  def index
    @new_tweet = Tweet.new
    @tweets = Tweet.all
    @user = User.last # Pretend this is the "signed in" user
  end

  def create
    @tweet = Tweet.new(tweet_params)
    @tweet.user = User.last # Pretend this is the "signed in" user
    if !@tweet.save
      flash[:error] = @tweet.errors.full_messages.join("\n")
    end

    redirect_to root_path
  end

  # We don't need this action because we're can create tweets
  # right from the index page
  # def new
  # end

  def delete
    @tweet = Tweet.find(params[:id])
    if @tweet.user == User.last
      flash[:success] = "Tweet destroyed!"
      @tweet.destroy
    else
      flash[:error] = "That's not your tweet to delete!"
    end

    redirect_to root_path
  end

  private

    def tweet_params
      params.require(:tweet).permit(:body)
    end
end
