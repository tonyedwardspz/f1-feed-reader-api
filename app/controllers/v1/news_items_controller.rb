class V1::NewsItemsController < ApplicationController
  def index
    puts "***************** Index ******************"
    @news_items = NewsItem.all.order("pub_date DESC").limit(30)
  end
end
