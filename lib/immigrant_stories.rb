class Immigrants

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :profile_url

  def initialize(name=nil, profile_url=nil)
    @name = name
    @profile_url = profile_url
  end

  def self.new_from_profile(info)
    self.new(
    info.css("p").text,
    "http://immigrants.mndigital.org/#{info.css("a.exhibit-item.exhibit-gallery-item").attribute("href").text}"
    )
  end
