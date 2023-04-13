require 'rails_helper'

RSpec.describe Task, type: :model do
  subject(:task) { described_class.new(title: title, deadline: deadline) }

  context 'when title and deadline indicated' do
    let(:title) { 'Feed your dog' }
    let(:deadline) { Date.current }

    specify { expect(task).to be_valid }
  end

  context 'when title is empty' do
    let(:title) { nil }
    let(:deadline) { Date.current }

    specify { expect(task).to be_invalid }
  end

  context 'when deadline is empty' do
    let(:title) { 'Feed your dog' }
    let(:deadline) { nil }

    specify { expect(task).to be_invalid }
  end

  describe '#formatted_deadline' do
    let(:title) { 'Feed your dog' }
    let(:deadline) { Date.parse('2023-01-10') }

    specify { expect(task.formatted_deadline).to eq('10-01-2023') }
  end
end
