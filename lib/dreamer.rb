require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/story.rb'
require_relative '../lib/cli.rb'

class Dreamer


  attr_accessor :name, :profile_url, :bio, :ethnicity, :world_region, :language, :story


  @@all = []


  def initialize(name=nil, profile_url=nil)
    @name = name
    @profile_url = profile_url
    @@all << self
  end

  def self.new_from_profile(dream)
#counter
#this needs to go weird hook
    self.new(
    index_url.css("p").map(&text)
    index_url.css("div.exhibit-gallery-item a").map {|link| "http://immigrants.mndigital.org" + link['href']}
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
