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





end
