# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Comment, type: :model do
  subject do
    described_class.new(body: 'Example body', commenter: 'Some commenter')
  end

  describe 'Validations' do
    it 'is valid with valid attributes' do
      post = create :post
      comment = create :comment, post: post
      expect(comment).to be_valid
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
end
