class ChangeV1NewsItemsToNewsItems < ActiveRecord::Migration
  def change
    rename_table :v1_news_items, :news_items
  end
end
