class ChangePubDateToPubDate < ActiveRecord::Migration
  def change
    rename_column :news_items, :pubDate, :pub_date
  end
end
