require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../immigrant_stories/scraper.rb'
require_relative '../immigrant_stories/cli.rb'

class Dreamer


  attr_accessor :name, :profile_url, :bio, :ethnicity, :world_region, :language, :story


  @@all = []


  def initialize(profile_url=nil)
    @profile_url = profile_url
    fill_out_profile
    @@all << self
  end

  def fill_out_profile
    attributes = Scraper.scrape_dreamer_profiles(self)
    @name = attributes[:name]
    @bio = attributes[:bio]
    @ethnicity = attributes[:ethnicity]
    @language = attributes[:language]
    @world_region = attributes[:world_region]
    @story = attributes[:story]
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
