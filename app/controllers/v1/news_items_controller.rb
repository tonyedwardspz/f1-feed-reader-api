class V1::NewsItemsController < ApplicationController
  after_filter :fetch, :only => :index

  def index
    @news_items = NewsItem.all.order("pub_date DESC").limit(30)
  end

  private
    def fetch
      NewsItem.fetch_all_feeds
    end
end
