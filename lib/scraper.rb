require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper

  def get_page
#    Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
#    binding.pry
  end

  def scrape_immigrant_profiles
    doc = Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/item/619"))
    binding.pry
  end
end

Scraper.new.get_page

#names: doc.css("p").text
#profile_url: doc.css("a.exhibit-item-link").attribute("href").value

#profile_video: doc.css("[@id='playlist'] li[1] a").attribute("href").value
