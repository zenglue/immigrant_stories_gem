require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/dreamers.rb'

class Story

  attr_reader :dreamer, :profile_video, :video_transcript

  @@all = []

  def initialize(dreamer=nil)
    @stories = []

    if dreamer != nil
      self.dreamer = dreamer
    end
  end

  def self.new_from_profile
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end

  def dreamer=(dreamer)
    @dreamer = dreamer
  end

  def self.find_by_region(region)
#    @@all.find_all {|reg| reg == region}
    dreamer = @@all.sort_by(region)
  end

  def self.find_by_ethnicity(ethnicity)
#    @@all.find_all {|ethnic| ethnic == ethnicity}
    dreamer = @@all.sort_by(ethnicity)
  end

  def self.find_by_language(language)
#    @@all.find_all {|langu| langu == language}
    dreamer = @@all.sort_by(language)
  end

end
