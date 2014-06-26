require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe SambaVideos::Project do
  it 'finds the project' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/projects/1.json?access_token=TOKEN',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'project.json'),
      status: 200
    )

    project = SambaVideos::Project.find(1, params: { access_token: 'TOKEN' })

    expect(project.id).to eq 1
    expect(project.name).to eq 'Teste'
  end

  it 'finds all project' do
    FakeWeb.register_uri(
      :get,
      'http://api.sambavideos.sambatech.com/v1/projects.json?access_token=TOKEN',
      body: File.join(File.dirname(__FILE__), '..', 'fixtures', 'projects.json'),
      status: 200
    )

    projects = SambaVideos::Project.all(params: { access_token: 'TOKEN' })

    expect(projects.count).to eq 3
    expect(projects.first.id).to eq 1
    expect(projects.first.name).to eq 'Teste'
  end
end
