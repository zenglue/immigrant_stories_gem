require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/scraper.rb'

class CLI

  def call
    Scraper.new.scrape_index_page
    start
  end

  def start
    puts ""
    puts "Whose immigration story would you like to listen to?"
    input = gets.chomp
  end
end
