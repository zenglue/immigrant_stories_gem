
class Scraper

  def self.scrape_index_page

    index_url = Nokogiri::HTML(open("http://immigrants.mndigital.org/exhibits/show/immigrantstories-exhibit/page01"))

    profile_urls = index_url.css("div.exhibit-gallery-item a").map {|link| "http://immigrants.mndigital.org" + link['href']}
  end

#  index_array.each_with_index {|name, i| @@all[name] = profile_urls[i]}

  def self.scrape_dreamer_profiles(dreamer)

    profile_url = Nokogiri::HTML(open("#{dreamer.profile_url}"))

    dreamer_attributes = {}

    name ||= profile_url.css("[@id='dublin-core-title'] div").text
    bio ||= profile_url.css("[@id='dublin-core-description'] div").text
    ethnicity ||= profile_url.css("[@id='item-type-ethnicity'] div a").text
    region ||= profile_url.css("[@id='item-type-world-region'] div a").text
    language ||= profile_url.css("[@id='dublin-core-language'] div a").text
    profile_video ||= profile_url.css("[@id='playlist'] li[1] a").attribute("href").value
    video_transcript ||= profile_url.css("[@id='item-transcription'] div").text

    dreamer_attributes[:name] = name
    dreamer_attributes[:bio] = bio
    dreamer_attributes[:ethnicity] = ethnicity
    dreamer_attributes[:world_region] = region
    dreamer_attributes[:language] = language
    dreamer_attributes[:profile_video] = profile_video
    dreamer_attributes[:story] = video_transcript
    dreamer_attributes
  end
end
