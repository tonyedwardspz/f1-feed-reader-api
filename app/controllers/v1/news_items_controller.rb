class V1::NewsItemsController < ApplicationController
  require 'crack'

  require 'rubygems'
  require 'readability'
  require 'open-uri'

  def index



    # source = open('http://www.bbc.co.uk/sport/0/formula1/34237355').read
    # content = Readability::Document.new(source).content
    # content = content.gsub('&#13;', '')

    # puts content

    BbcFeed.fetch_feed

    @news_items = NewsItem.all.limit(30)
  end

end
