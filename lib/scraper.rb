require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/cli.rb'

class Scraper

  def scrape_index_page
    dream = Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
    dream.css.map do |dream|
      {        
        :name => dream.css("p").text
      }
    end
  end

  def scrape_dreamer_profiles
    profile_url = story.profile_url

    dreamer_attributes = {}

    bio ||= profile_url.css("[@id='dublin-core-description'] div").text
    ethnicity ||= profile_url.css("[@id='item-type-ethnicity'] div a").text
    region ||= profile_url.css("[@id='item-type-world-region'] div a").text
    language ||= profile_url.css("[@id='dublin-core-language'] div a").text

    dreamer_attributes[:bio] = bio
    dreamer_attributes[:ethnicity] = ethnicity
    dreamer_attributes[:region] = region
    dreamer_attributes[:language] = language
    dreamer_attributes
  end
end
