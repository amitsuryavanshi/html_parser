class Document < ApplicationRecord
  has_many :tags

  validates :url, :format => URI::regexp(%w(http https))

  before_create :parse_url

  def parse_url
  	html_tags, error = DocumentService.parse_url_html(self.url)
  	binding.pry
  	self.tags = html_tags
  	self.errors[:base] << error if error
  end
end
