require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/stories.rb'

class Dreamer

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :stories

  @@all = []

  def initialize(name=nil, profile_url=nil)
    @name = name
    @@all << self
    @stories = []
  end

  def self.new_from_profile(dreamer)
    dream = scraper.getpage
    self.new tap do |dreamer|
      dream.css("p").text.each {|key,value| self.send("#{key}=", value)}
    end
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
end
