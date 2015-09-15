class BbcFeed < ActionController::Base

  def fetch_feed
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
  end

end
