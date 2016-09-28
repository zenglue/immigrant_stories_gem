class Immigrants

  attr_accessor :name, :bio, :ethnicity, :world_region, :language, :profile_video, :video_transcript, :profile_url

  def initialize(name=nil, profile_url=nil)
    @name = name
    @profile_url = profile_url
  end
