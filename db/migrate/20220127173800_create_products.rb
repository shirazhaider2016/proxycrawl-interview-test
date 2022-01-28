class CreateProducts < ActiveRecord::Migration[6.1]
  def change
    create_table :products do |t|
      t.string :title
      t.string :image_url
      t.float  :price
      t.string :currency_symbol
      t.string :customer_review
      t.string :review_count
      t.string :asin

      t.timestamps
    end
  end
end
