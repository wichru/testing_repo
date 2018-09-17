# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PostsController, type: :controller do
  describe 'GET #index' do
    it 'returns HTTP success' do
      get :index
      expect(response).to be_successful
    end

    it 'fetch post' do
      Post.create(title: 'Sth', text: 'New Post')

      get :index

      expect(assigns(:post)).to be_a_new(Post)
      expect(assigns(:posts)).to match_array(Post.all)
    end
  end

  describe 'GET #create' do
    it 'creates post' do
      expect do
        post :create, params: { post: { title: 'It should works',
                                        text: 'Please work!' } }
      end.to change(Post, :count).by(1)
      expect(response).to have_http_status(:redirect)
    end
  end

  describe 'GET #edit' do
    it 'edit post' do
      post = Post.create(title: 'Title', text: 'Please work!')
      get :edit, params: { id: post }

      expect(response).to have_http_status(:success)
      expect(assigns(:post)).to eq(post)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes post' do
      post = Post.create(title: 'Title', text: 'Please work!')
      expect do
        delete :destroy, params: { id: post }
        post.to change(Post, :count).by(-1)
      end
      expect(response).to be_successful
    end
  end
end
