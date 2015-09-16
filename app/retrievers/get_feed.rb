class GetFeed
  require 'crack'

  def self.fetch_all_feeds
    self.fetch_bbc_feed
    self.fetch_telegraph_feed
  end

  def self.fetch_bbc_feed
    url = URI.parse('http://feeds.bbci.co.uk/sport/0/formula1/rss.xml')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    parsedItems = Crack::XML.parse(res.body)

    parsedItems["rss"]["channel"]["item"].each do |itm|
      if NewsItem.where(:link => itm["link"]).blank?
        NewsItem.create(:title => itm["title"],
                        :description => itm["description"],
                        :link => itm["link"],
                        :pub_date => itm["pubDate"],
                        :source => "BBC"
        )
      end
    end
  end

  def self.fetch_telegraph_feed
    url = URI.parse('http://www.telegraph.co.uk/sport/motorsport/formulaone/rss')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
    parsedItems = Crack::XML.parse(res.body)

    parsedItems["rss"]["channel"]["item"].each do |itm|
      if NewsItem.where(:link => itm["link"]).blank?
        NewsItem.create(:title => itm["title"],
                        :description => ActionView::Base.full_sanitizer.sanitize(itm["description"]) + ".",
                        :link => itm["guid"],
                        :pub_date => itm["pubDate"],
                        :source => "Telegraph"
        )
      end
    end
  end

end
