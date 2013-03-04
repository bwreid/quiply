class HashtagsController < ApplicationController
  before_filter :is_logged_in

  def show
    @hashtag = Hashtag.find(params[:id])
  end
end