require 'nokogiri'
require 'open-uri'
require 'pry'

require_relative '../lib/dreamer.rb'
require_relative '../lib/story.rb'
require_relative '../lib/scraper.rb'

class CLI

  def call
    Dreamer.new.new_from_profile
    list
  end

  def list
    puts ""
    Dreamer.all.each.with_index(1) {|dreamer, i| "#{i}. #{dreamer.name}"}
    end
  end

  def start

    puts ""
    puts "Whose immigration story would you like hear?"
    puts ""
    list
    puts ""
    input = gets.chomp

    dreamer = Dreamer.find(input.to_i)
  end
end


#  def start
#    puts ""
#    puts "Whose immigration story would you like to listen to?"
#    input = gets.chomp
#  end
#end
