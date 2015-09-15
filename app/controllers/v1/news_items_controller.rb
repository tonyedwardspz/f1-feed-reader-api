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

    @news_items = V1::NewsItem.all.limit(30)
  end

end
