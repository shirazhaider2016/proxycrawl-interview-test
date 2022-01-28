# == Schema Information
#
# Table name: products
#
#  id              :bigint           not null, primary key
#  asin            :string(255)
#  currency_symbol :string(255)
#  customer_review :string(255)
#  image_url       :string(255)
#  price           :float(24)
#  review_count    :string(255)
#  title           :string(255)
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class Product < ApplicationRecord
  validates_uniqueness_of :asin

  validates :title, presence: true
  validates :asin, presence: true

  def self.store_scrape_data(url)
    products = AmazonSerp.new(url).products
    products.each do |data|
      product = Product.find_or_initialize_by(asin: data[:asin])
      product.title = data[:title]
      product.image_url = data[:image_url]
      product.price = data[:price]&.to_f
      product.currency_symbol = data[:currency_symbol]
      product.customer_review = data[:customer_review]
      product.review_count = data[:review_count]
      product.save!
    end
  end
end
