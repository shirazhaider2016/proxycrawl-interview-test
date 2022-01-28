every :monday, :at => '10:00 am' do
  rake "proxycrawl:crawl_amazon_serp"
end

