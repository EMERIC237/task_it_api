# spec/models/task_spec.rb
require "rails_helper"

RSpec.describe Task, type: :model do
  context "Validation tests" do
    it "is valid with valid attributes" do
      task = build(:task)
      expect(task).to be_valid
    end

    it "is not valid without a title" do
      task = build(:task, title: nil)
      expect(task).not_to be_valid
    end

    it "is not valid without a description" do
      task = build(:task, description: nil)
      expect(task).not_to be_valid
    end

    it "is not valid with an invalid priority" do
      task = build(:task, priority: "extreme")
      expect(task).not_to be_valid
      expect(task.errors[:priority]).to include("is not included in the list")
    end
  end

  context "Association tests" do
    it { should belong_to(:user) }
    it { should have_many(:daily_plan_tasks).dependent(:destroy) }
    it { should have_many(:daily_plans).through(:daily_plan_tasks) }
  end
end
