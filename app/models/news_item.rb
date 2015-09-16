class NewsItem < ActiveRecord::Base

  def self.fetch_all_feeds
    GetFeed.fetch_bbc_feed
    GetFeed.fetch_telegraph_feed
  end

end
