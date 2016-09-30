require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/scraper.rb'

class CLI

  def call
    Dreamer.new_from_profile #kind of crap but maybe
#    add_attributes_to_dreamers
    start
  end

  def list
    puts ""
    Dreamer.all.each.with_index(1) {|dreamer, i| "#{i}. #{dreamer.name}"}
    end
  end

  def profile_info(dreamer)
    puts ""
    puts "#{dreamer.name}"
    puts "Bio:" + " #{dreamer.bio}"
    puts "World Region:" + " #{dreamer.world_region}"
    puts "Ethnicity:" + "#{dreamer.ethnicity}"
    puts "Language:" + " #{dreamer.language}"
  end

  def start

    puts ""
    puts "Whose immigration story would you like hear?"
    puts ""
    list
    puts ""
    input = gets.chomp

    dreamer = Dreamer.find(input.to_i)

    puts ""
    puts "#{dreamer.story}"
    puts ""
    puts "Would you like more info on #{dreamer.name}?"
    puts "Yes or No?"

    input = gets.chomp.downcase
    if input == ("yes" || "y")
      profile_info(dreamer)
      puts "Would you like to read another story?"
      puts "Yes or No?"

      input = gets.chomp.downcase
      if input == ("yes" || "y")
        start
      else
        puts ""
        puts "See you later!"
        exit
      end
    end
  end
end

#  def add_attributes_to_dreamers
#    Dreamer.all.each do |dreamer|
#      attributes = Scraper.scrape_dreamer_profiles(dreamer.profile_url)
#      dreamer.add_dreamer_attributes(attributes)
#    end
#  end


#  def start
#    puts ""
#    puts "Whose immigration story would you like to listen to?"
#    input = gets.chomp
#  end
#end
