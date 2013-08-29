class FeedsController < ApplicationController
  def index
    @feeds = current_user.feeds
    respond_to do |format|
      format.html { render :index }
      format.json { render "index.rabl" }
    end
  end

  def show
    @feed = Feed.find(params[:id])
    #reload if over 2 mins. since update
    current = Time.now()
    begin
    if (current - @feed.updated_at) > 120
      @feed.reload
    end
  rescue => e
    puts "rescued the RSS error-----
    error message: #{e.message}"
  end
    # render :show

    respond_to do |format|
      format.html { render :show }
      format.json { render "show.rabl" }
    end
  end

  def create
    feed = Feed.find_or_create_by_url(params[:feed][:url])
    if feed
      render :json => feed
    else
      render :json => { error: "invalid url" }, status: :unprocessable_entity
    end
  end
end
