class V1::NewsItemsController < ApplicationController

  after_filter :fecth, :only => :index

  def index
    puts "***************** Index ******************"
    @news_items = NewsItem.all.order("pub_date DESC").limit(30)
  end


  private
    def fetch
      GetFeed.fetch_bbc_feed
      GetFeed.fetch_telegraph_feed
    end

end
