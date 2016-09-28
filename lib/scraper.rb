require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/immigrant_stories.rb'

class Scraper

  def get_page
    Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
  end

  def scrape_index_page
    dreamers = Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))
    dreamers.css.each do |dream|
      Immigrants.new_from_profile(dream)
    end
  end

  def scrape_dreamer_profiles
    profile_url = immigrants.profile_url

    dreamer_attributes = {}

    bio = profile_url.css("[@id='dublin-core-description'] div").text
    ethnicity = profile_url.css("[@id='item-type-ethnicity'] div a").text
    region = profile_url.css("[@id='item-type-world-region'] div a").text
    language = profile_url.css("[@id='dublin-core-language'] div a").text
    profile_video = profile_file.css("[@id='playlist'] li[1] a").attribute("href").value
    video_transcript = profile_url.css("[@id='item-transcription'] div").text

    dreamer_attributes[:bio] = bio
    dreamer_attributes[:ethnicity] = ethnicity
    dreamer_attributes[:region] = region
    dreamer_attributes[:language] = language
    dreamer_attributes[:profile_video] = profile_video
    dreamer_attributes[:video_transcript] = video_transcript
  end
end
