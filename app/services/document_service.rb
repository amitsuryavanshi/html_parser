require 'open-uri'
class DocumentService
  class << self
    def parse_url_html(url)
      tags = []
      begin
        page = Nokogiri::HTML(open(url))
        # would like to parse this once and get all the tags
        page.css('h1').each { |h1| tags << Tag.new(content: h1.text, name: 'h1') }
        page.css('h2').each { |h2| tags << Tag.new(content: h2.text, name: 'h2') }
        page.css('h3').each { |h3| tags << Tag.new(content: h3.text, name: 'h2') }
        page.css('a').each { |a|  tags << Tag.new(content: a['href'], name: 'link') }
      rescue Exception => e
        error = 'Error while connecting/parsing URL, Please try again in sometime or contact admin.'
      end
      [tags, error]
    end
  end
end