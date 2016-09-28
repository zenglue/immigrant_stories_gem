require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/immigrant_stories.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
  end

  def scrape_immigrant_profiles
    dreamers = Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
    dreamers.css.each do |dream|
      Immigrants.new_from_profile(dream)
    end
  end


end

#names: doc.css("p").text
#profile_url: doc.css("a.exhibit-item-link").attribute("href").value

#profile_video: profile_file.css("[@id='playlist'] li[1] a").attribute("href").value
#bio: profile_url.css("[@id='dublin-core-description'] div").text
#ethnicity: profile_url.css("[@id='item-type-ethnicity'] div a").text
#region: profile_url.css("[@id='item-type-world-region'] div a").text
#language: profile_url.css("[@id='dublin-core-language'] div a").text
##video_transcript: doc.css("[@id='item-transcription'] div").text
