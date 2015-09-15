class AlterColumnNewsItemsPubDate < ActiveRecord::Migration
  def change
    change_column :news_items, :pubDate, :datetime
  end
end
