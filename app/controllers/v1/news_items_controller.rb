class V1::NewsItemsController < ApplicationController
  require 'crack'

  require 'rubygems'
  require 'readability'
  require 'open-uri'

  def index

    url = URI.parse('http://feeds.bbci.co.uk/sport/0/formula1/rss.xml')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    parsedItems = Crack::XML.parse(res.body)

    parsedItems["rss"]["channel"]["item"].each do |itm|
      if NewsItem.where(:link => itm["link"]).blank?
        NewsItem.create(:title => itm["title"], :description => itm["description"], :link => itm["link"], :pubDate => itm["pubDate"])
      end
    end

    source = open('http://www.bbc.co.uk/sport/0/formula1/34237355').read
    content = Readability::Document.new(source).content
    content = content.gsub('&#13;', '')

    puts content

    @news_items = V1::NewsItem.all
  end

end
