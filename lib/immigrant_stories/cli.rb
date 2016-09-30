
class CLI

  def call

    puts "loading..."
    puts ""
    puts ""
    puts ""
    puts ""
    puts ""
    puts "...and still loading"

    profile_urls = Scraper.scrape_index_page
    profile_urls.each {|dreamer| Dreamer.new_from_profile_url(profile_urls)}

    start
  end

  def list
    puts ""
    Dreamer.all.each.with_index(1) {|dreamer, i| puts "#{i}. #{dreamer.name}"}
    end
  end

  def profile_info(dreamer)
    puts ""
    puts "#{dreamer.name}"
    puts ""
    puts "Bio:" + "  #{dreamer.bio}"
    puts ""
    puts "World Region:" + "  #{dreamer.world_region}"
    puts ""
    puts "Ethnicity:" + "  #{dreamer.ethnicity}"
    puts ""
    puts "Language:" + " #{dreamer.language}"
  end

  def start
    puts ""
    puts "Whose immigration story would you like to hear?"
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

      how_about_another

    else
      puts ""
      how_about_another
    end
  end

  def how_about_another
    puts ""
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
