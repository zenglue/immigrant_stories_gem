require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/story.rb'

class Dreamer

  attr_accessor :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :stories

  @@all = []

  def initialize
    @@all << self
    @stories = {}
  end

  def self.new_from_profile(profile_url)
    profile_url = scraper.getpage
    self.new tap do |dreamer|
      dream.css("p").text.each {|key,value| @dreamer.send("#{key}=", value)}
    end
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end

  def add_dreamer_attributes(dreamers_hash)
    dreamers_hash.each {|key, value| self.send("#{key}=", value)}
  end
end
