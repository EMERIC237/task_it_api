# spec/models/daily_plan_spec.rb
require "rails_helper"

RSpec.describe DailyPlan, type: :model do
  context "Validation tests" do
    let(:user) { create(:user) }
    it "is valid with a unique date and user combination" do
      create(:daily_plan, user: user, date: Date.today)
      daily_plan = build(:daily_plan, user: user, date: Date.tomorrow)
      expect(daily_plan).to be_valid
    end

    it "is not valid with a duplicate date for the same user" do
      create(:daily_plan, user: user, date: Date.today)
      daily_plan = build(:daily_plan, user: user, date: Date.today)
      expect(daily_plan).not_to be_valid
    end
  end

  context "Association tests" do
    it { should belong_to(:user) }
    it { should have_many(:tasks).through(:daily_plan_tasks) }
  end
end
