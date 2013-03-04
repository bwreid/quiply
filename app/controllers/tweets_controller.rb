class TweetsController < ApplicationController
  before_filter :is_logged_in

  def index
    @tweets = Tweet.order(:created_at).reverse
  end

  def new
    @tweet = Tweet.new
  end

  def edit
  end

  def update
  end

  def create
    # if params[:id].present?
    #   priority = Priority.find(params[:id])
    #   priority.color = params[:color]
    #   priority.title = params[:name]
    #   priority.level = params[:value]
    #   priority.save
    # else

    tweet = Tweet.new( :content => params[:content] )
    if tweet.save
      @auth.tweets << tweet
      tweet.find_hashtags.each { |x| tweet.hashtags << Hashtag.find_or_create_by_name(x.downcase) }
    end
    # end
    render :json => tweet # TAKES THE OBJECT THAT IS CREATED AND TURNS INTO JSON
  end

  def destroy
  end

end
