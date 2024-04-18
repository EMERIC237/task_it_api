# spec/models/daily_plan_task_spec.rb
require "rails_helper"

RSpec.describe DailyPlanTask, type: :model do
  context "Association tests" do
    it { should belong_to(:daily_plan) }
    it { should belong_to(:task) }
  end

  context "Validation tests" do
    it "is valid with both time slots" do
      daily_plan_task = build(:daily_plan_task)
      expect(daily_plan_task).to be_valid
    end

    it "is not valid without a time_slot_start" do
      daily_plan_task = build(:daily_plan_task, time_slot_start: nil)
      expect(daily_plan_task).not_to be_valid
    end

    it "is not valid without a time_slot_end" do
      daily_plan_task = build(:daily_plan_task, time_slot_end: nil)
      expect(daily_plan_task).not_to be_valid
    end
  end
end
