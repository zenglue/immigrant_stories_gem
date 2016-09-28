require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/dreamer.rb'

class Story

  attr_reader :dreamer, :profile_url, :profile_video, :video_transcript

  @@all = []

  def initialize(dreamer=nil)
    @dreamer = dreamer
    @profile_url = profile_url
    @stories = {}

    if dreamer != nil
      self.dreamer = dreamer
    end
  end

  def self.new_from_profile(profile_url)
    profile_url = "http://immigrants.mndigital.org/#{proile_url.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
    dreamer = self.new tap do |dream|
       profile_url(profile_url) each {|k,v| self.send("#{k}=", v)}
      end
    end
    dreamer.save
    dreamer
  end

  def self.new_from_hash
    stories = self.new_from_hash
    stories.dreamer = hash[:dreamer]

    profile_video ||= profile_file.css("[@id='playlist'] li[1] a").attribute("href").value
    video_transcript ||= profile_url.css("[@id='item-transcription'] div").text

    stories[:profile_video] = profile_video
    stories[:video_transcript] = video_transcript
    stories
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
