describe Schedule, type: :model do
  it 'title cannot be blank' do
    expect(Schedule.create(title: '')).to_not be_valid
  end

  it 'has a valid title' do
    expect(Schedule.create(title: 'moo')).to be_valid
  end

  it { should have_many(:weeks) }
end
