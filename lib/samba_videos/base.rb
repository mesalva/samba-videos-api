require 'samba_videos/initialization'

module SambaVideos
  class Base < ActiveResource::Base
    self.site = SambaVideos::API_BASE_URL
  end
end
