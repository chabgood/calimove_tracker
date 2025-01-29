describe Schedule, type: :model do
  include ActionDispatch::TestProcess::FixtureFile

  it 'title cannot be blank' do
    expect(Schedule.create(title: '')).to_not be_valid
  end

  it 'has a valid title' do
    expect(Schedule.create(title: 'moo')).to be_valid
  end

  it { should have_many(:weeks) }

  describe '.import' do
    let(:file) { fixture_file_upload("test_upload.xlsx") }
    subject { Schedule.import(file) }
    it 'imports the cali move file' do
      expect { subject }.to change { Schedule.count }.by(1).and change { Week.count }.by(5).and change { Day.count }.by(85)
    end
  end
end
