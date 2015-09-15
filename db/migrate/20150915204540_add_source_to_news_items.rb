class AddSourceToNewsItems < ActiveRecord::Migration
  def change
    add_column :news_items, :source, :string
  end
end
