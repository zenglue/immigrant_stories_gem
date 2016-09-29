require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/scraper.rb'

class CLI

  def call
    list
  end

  def list
    puts ""
    puts "Whose immigration story would you like to listen to?"
    puts ""
    Dreamer.all.each.with_index(1) do |dreamer, i|
      puts "#{i}. #{dreamer.name}"
    end
    puts ""
  end
end

#  def start
#    puts ""
#    puts "Whose immigration story would you like to listen to?"
#    input = gets.chomp
#  end
#end
