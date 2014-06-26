require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SambaVideos::Category do
  it 'finds the category' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/categories/1.json?access_token=TOKEN&pid=1',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'category.json'),
      status: 200
    )

    category = SambaVideos::Category.find(1, params: { access_token: 'TOKEN', pid: 1 })

    expect(category.id).to eq 1
    expect(category.name).to eq 'Categoria Noticias'
  end

  it 'finds all category' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/categories.json?access_token=TOKEN&pid=1',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'categories.json'),
      status: 200
    )

    categorys = SambaVideos::Category.all(params: { access_token: 'TOKEN', pid: 1 })

    expect(categorys.count).to eq 3
    expect(categorys.first.id).to eq 1
    expect(categorys.first.name).to eq 'Categoria Noticias'
  end
end
