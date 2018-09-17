# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    described_class.new(body: 'Example body', commenter: 'Some commenter')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      post = Post.new(title: 'Some title', text: 'Example text body')
      expect(post.valid?).to be_truthy
    end

    it 'is not valid without a body' do
      subject.body = nil
      expect(subject).to_not be_valid
    end

    it 'is not valid without a commenter' do
      subject.commenter = nil
      expect(subject).to_not be_valid
    end
  end

  describe 'Accociations' do
    it 'should belongs to the post' do
      Comment.reflect_on_association(:post).macro.should == :belongs_to
      # it { is_expected_to.belong_to(:post) }
    end
  end
end
