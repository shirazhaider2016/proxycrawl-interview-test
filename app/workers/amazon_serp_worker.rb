class AmazonSerpWorker
  include Sidekiq::Worker
  sidekiq_options :retry => 1
  @@logger = Logger.new "#{Rails.root}/log/#{self.name.underscore.downcase}.log"

  def perform
    amazon_urls = AmazonUrl.all
    amazon_urls.each do |amazon_url|
      Product.store_scrape_data(amazon_url.url)
    end
  end
end