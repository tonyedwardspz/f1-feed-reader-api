class AddFieldsToNewsItems < ActiveRecord::Migration
  def change
    add_column :v1_news_items, :title, :string
    add_column :v1_news_items, :description, :string
    add_column :v1_news_items, :link, :string, index: true, unique: true
    add_column :v1_news_items, :pubDate, :date
    add_column :v1_news_items, :image, :string
  end
end
