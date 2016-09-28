require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
    binding.pry
  end
end

Scraper.new.get_page
