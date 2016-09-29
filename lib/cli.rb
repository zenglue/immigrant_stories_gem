require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/scraper.rb'

class CLI

  BASE_URL = "http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"

  def call
    make_dreamers
    list
  end

  def list
    puts ""
    puts "Whose immigration story would you like to listen to?"
    puts ""
    Dreamer.all.each.with_index(1) do |dreamer, i|
      puts "#{i}. #{dreamer.name}"
    end
  end

  def make_dreamers
    dreamers_array = Scraper.scrape_index_page(BASE_URL)
    Dreamer.create_from_collection(dreamers_array)
  end
end

#  def start
#    puts ""
#    puts "Whose immigration story would you like to listen to?"
#    input = gets.chomp
#  end
#end
