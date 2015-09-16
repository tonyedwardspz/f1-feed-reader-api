class V1::NewsItemsController < ApplicationController
  def index
    @news_items = NewsItem.all.order("pub_date DESC").limit(30)
  end
end
