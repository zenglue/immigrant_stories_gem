require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/story.rb'
require_relative '../lib/cli.rb'

class Dreamer


  attr_accessor :name, :profile_url, :bio, :ethnicity, :world_region, :language, :stories


  @@all = []

  def initialize(name=nil, profile_url=nil)
    @name = name
    @profile_url = profile_url
    @@all << self
    @stories = {}
  end

  def self.new_from_profile(dream)
    self.new(
    dream.css("p").text,
    dream.css("div.exhibit-gallery-item a").map {|link| "http://immigrants.mndigital.org" + link['href']}
    )
  end

#  def self.new_from_url(url)
#    Dreamer.new.tap do |dreamer|
#      Scraper.url(url) each {|k,v| dreamer.send("#{k}=", v)}
#    end
#  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
#  def add_dreamer_attributes(dreamers_hash)
#    dreamers_hash.each {|key, value| self.send("#{key}=", value)}
#  end
