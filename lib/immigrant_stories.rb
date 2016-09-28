require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'

class Immigrants

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :profile_url

  @@all = []

  def initialize(name=nil, profile_url=nil)
    @name = name
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

  

end
