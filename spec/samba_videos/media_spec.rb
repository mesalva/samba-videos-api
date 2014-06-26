require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SambaVideos::Media do
  it 'finds the media' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/medias/123abc.json?access_token=TOKEN&pid=1',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'media.json'),
      status: 200
    )

    media = SambaVideos::Media.find('123abc', params: { access_token: 'TOKEN', pid: 1 })

    expect(media.id).to eq '123abc'
    expect(media.title).to eq 'Teste'
  end

  it 'finds all media' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/medias.json?access_token=TOKEN&pid=1',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'medias.json'),
      status: 200
    )

    medias = SambaVideos::Media.all(params: { access_token: 'TOKEN', pid: 1 })

    expect(medias.count).to eq 3
    expect(medias.first.id).to eq '123abc'
    expect(medias.first.title).to eq 'Teste'
  end
end
