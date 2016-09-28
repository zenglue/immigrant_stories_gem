require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/scraper.rb'
require_relative '../lib/dreamers.rb'

class Stories

  attr_reader :dreamer

  @@all = []

  def initialize(dreamer=nil)
    @stories = []

    if dreamer != nil
      self.dreamer = dreamer
    end
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
