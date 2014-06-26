require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SambaVideos::Base do
  describe 'location' do
    it 'sets site to samba videos api url' do
      expect(SambaVideos::Base.site.to_s).to eq 'http://api.sambavideos.sambatech.com/v1'
    end
  end
end
