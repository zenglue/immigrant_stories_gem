class CLI

  def call
    Scraper.new.scrape_index_page
    start
  end

  def Start
    puts ""
    puts "Whose immigration story would you like to listen to?"
    input = gets.chomp
  end
end
