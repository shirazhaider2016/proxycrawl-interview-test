namespace :proxycrawl do
  desc 'its call background worker and store products'
  task crawl_amazon_serp: :environment do
    AmazonSerpWorker.perform_async
  end
end