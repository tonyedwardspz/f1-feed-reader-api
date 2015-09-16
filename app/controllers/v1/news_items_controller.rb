class V1::NewsItemsController < ApplicationController
  def index
    GetFeed.fetch_all_feeds
    @news_items = NewsItem.all.order("pub_date DESC").limit(30)
  end

end
