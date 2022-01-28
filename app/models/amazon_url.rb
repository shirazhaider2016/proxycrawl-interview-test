# == Schema Information
#
# Table name: amazon_urls
#
#  id         :bigint           not null, primary key
#  title      :string(255)
#  url        :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class AmazonUrl < ApplicationRecord
  validates_uniqueness_of :url

  validates :url, format: URI::regexp(%w[http https])
  validates :url, presence: true
  validates :title, presence: true
end
