require 'proxycrawl'
require 'nokogiri'

class AmazonSerp
  def initialize(url)
    @api = ProxyCrawl::API.new(token: ENV['PROXYCRAWL_API_NORMAL_KEY'])
    @html = @api.get(url)
  end

  def products
    doc = Nokogiri::HTML(@html.body)
    data = []
    products = doc.css('div.s-main-slot div.s-asin')
    products.each do |product|
      hash = {}
      hash[:title] = product.css('h2 span.a-size-medium').text
      hash[:image_url] = product.css('span[data-component-type=s-product-image] img').attribute('src').value
      hash[:price] = product.css('span.a-price[data-a-color=base] span.a-offscreen').text[1..-1]
      hash[:currency_symbol] = product.css('span.a-price[data-a-color=base] span.a-offscreen').text[0]
      review = product.css('div.a-section.a-spacing-none.a-spacing-top-micro')
      hash[:customer_review] = review.css('span.a-declarative i span').text
      hash[:review_count] = review.css('span.a-size-base').text
      hash[:asin] = product.attribute('data-asin').value
      data << hash
    end
    data
  end
end
