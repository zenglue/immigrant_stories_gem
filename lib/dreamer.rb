require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/stories.rb'

class Immigrants

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :profile_url

  @@all = []

  def initialize(name=nil, profile_url=nil)
    @name = dreamer_name
    @profile_url = profile_url
    @@all << self
  end

  def self.new_from_profile(dream)
    self.new(
    dream.css("p").text,
    "http://immigrants.mndigital.org/#{dream.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
    )
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def add_dreamer_attributes(dreamers_hash)
    dreamers_hash.each {|key, value|} self.send(("#{key}=", value))
  end

  def self.find_by_region(region)
    @@all.find_all {|reg| reg == region}
  end

  def self.find_by_ethnicity(ethnicity)
    @@all.find_all {|ethnic| ethnic == ethnicity}
  end

  def self.find_by_language(language)
    @@all.find_all {|langu| langu == language}
  end
end
