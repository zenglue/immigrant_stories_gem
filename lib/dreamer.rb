require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/story.rb'
require_relative '../lib/cli.rb'

class Dreamer


  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :stories


  @@all = []

  def initialize
    @name = name
    @@all << self
    @stories = {}
  end

  def self.new_from_profile(dream)
    self.new(
    dream.css("p").text
    "http://immigrants.mndigital.org/#{proile_url.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
    )
    end
  end

  def self.all
    @@all
  end
end

#  def self.find(id)
#    self.all[id-1]
#  end
#end

#  def add_dreamer_attributes(dreamers_hash)
#    dreamers_hash.each {|key, value| self.send("#{key}=", value)}
#  end
