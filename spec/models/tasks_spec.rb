require "spec_helper"

describe Task do
  describe ".valid_status?" do
    it "validate a status" do
      expect(Task.valid_status?('active')).to be_true
      expect(Task.valid_status?('completed')).to be_true
    end
    it "return false for invalid status" do
      expect(Task.valid_status?('other')).to be_false
    end
  end

  let(:active) { Task.create! task: 'some task', status: :active }
  let(:completed) { Task.create! task: 'some task', status: :completed }

  describe '.active' do
    it { expect(Task.active).to include(active) }

    it { expect(Task.active).to_not include(completed) }
  end

  describe '.completed' do
    it { expect(Task.completed).to_not include(active) }

    it { expect(Task.completed).to include(completed) }
  end
end