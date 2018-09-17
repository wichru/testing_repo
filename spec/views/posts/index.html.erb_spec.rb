require 'rails_helper'

RSpec.describe 'posts/index.html.erb', type: :view do
  it 'renders form' do
    assign(:posts, [])

     render

     expect(rendered).to match(/<form/)
  end
end
