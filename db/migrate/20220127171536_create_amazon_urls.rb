class CreateAmazonUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :amazon_urls do |t|
      t.string :title
      t.string :url

      t.timestamps
    end
  end
end
