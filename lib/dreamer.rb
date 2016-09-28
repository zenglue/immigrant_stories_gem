require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/stories.rb'

class Immigrant

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :profile_url, :stories

  @@all = []

  def initialize(name=nil, profile_url=nil)
    @name = name
    @profile_url = profile_url
    @@all << self
    @stories = []
  end

  def self.new_from_profile(dream)
    self.new(
    dream.css("p").text,
    "http://immigrants.mndigital.org/#{dream.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
    )
  end

#  def self.new_from_profile(profile_url)
#    profile_url = "http://immigrants.mndigital.org/#{proile_url.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
#    self.new tap do |dreamer|
#       profile_url(profile_url) each {|k,v| self.send("#{k}=", v)}
#      end
#    end
#  end

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
    #story.dreamer = @@all.sort_by(region)
  end

  def self.find_by_ethnicity(ethnicity)
    @@all.find_all {|ethnic| ethnic == ethnicity}
    #story.dreamer = @@all.sort_by(ethnicity)
  end

  def self.find_by_language(language)
    @@all.find_all {|langu| langu == language}
    #story.dreamer = @@all.sort_by(language)
  end
end
