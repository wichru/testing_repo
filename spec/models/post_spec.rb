require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { described_class.new }

  it 'is valid with valid attributes' do
    subject.title = 'Example title'
    subject.text = 'Some text body'
    expect(subject).to be_valid
  end

  it 'is not valid without a title' do
    subject.text = 'sth'
    expect(subject).to_not be_valid
  end

  it 'is not valid without a text' do
    subject.title = 'Some title'
    expect(subject).to_not be_valid
  end
end
