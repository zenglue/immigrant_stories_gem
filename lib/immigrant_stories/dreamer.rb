
class Dreamer

  attr_accessor :name, :profile_url, :bio, :ethnicity, :world_region, :language, :story

  @@all = []

  def initialize(profile_url=nil)
    @profile_url = profile_url
#    fill_out_profile
    @@all << self
  end

  def fill_out_profile
    attributes = Scraper.scrape_dreamer_profiles(self)
    @name = attributes[:name]
    @bio = attributes[:bio]
    @ethnicity = attributes[:ethnicity]
    @language = attributes[:language]
    @world_region = attributes[:world_region]
    @story = attributes[:story]
  end

  def self.new_from_profile_url(profile_urls)
    Dreamer.new.tap do |dreamer|
      Scraper.scrape_dreamer_profiles(dreamer).each {|k,v| self.send("#{k}=", v)}
    end
  end

  def self.all
    @@all
  end

  def self.find(id)
    self.all[id-1]
  end
end
