class EntriesController < ApplicationController
  def index
    feed = Feed.find(params[:feed_id])
    #reload if over 2 mins. since update
    current = Time.now()
    if (current - feed.updated_at) > 120
      feed.reload
    end
    render :json => feed.entries
  end
end
