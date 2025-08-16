describe Exercise, type: :model do
  it '#percentage' do
    #expect { create(:exercise, percentage: 80) }.to change {}
  end

  it "updates user_id" do
    FactoryBot.create(:exercise, :with_schedule)
    expect(Exercise.last.user_id).not_to be_nil
  end
end
