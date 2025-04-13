describe Schedule, type: :model do
  include ActionDispatch::TestProcess::FixtureFile
  let(:user) { create(:user) }
  subject { build(:schedule) }
  it { should validate_presence_of(:title) }


  it { should have_many(:weeks) }

  describe '.import' do
    let(:file) { fixture_file_upload("test_upload.xlsx") }
    subject { Schedule.import(user, file) }
    it 'imports the cali move file' do
      expect { subject }.to change { Schedule.count }.by(1).and change { Week.count }.by(5).and change { Day.count }.by(22).and change { Exercise.count }.by(85)
    end
  end
end
