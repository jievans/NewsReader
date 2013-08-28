class EntriesController < ApplicationController
  def index
    render :json => feed.entries
  end
end
