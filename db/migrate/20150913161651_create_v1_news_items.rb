class CreateV1NewsItems < ActiveRecord::Migration
  def change
    create_table :v1_news_items do |t|

      t.timestamps null: false
    end
  end
end
