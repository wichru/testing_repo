# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Post, type: :model do
  subject do
    described_class.new(title: 'Some title', text: 'Example text body')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a text' do
      subject.text = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Associations' do
    it 'should have many comments' do
      Post.reflect_on_association(:comments).macro.should == :has_many
      # it { is_expected_to.has_many(:comments) }
    end
  end
end
