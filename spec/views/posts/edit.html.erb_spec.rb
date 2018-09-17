# frozen_string_literal: true
 require 'rails_helper'

 RSpec.describe 'posts/edit.html.erb', type: :view do
  it 'renders form' do
    assign(:post, Post.create(title: 'sth', text: 'simple text'))

    render

    expect(rendered).to match(/<form/)
  end
end
