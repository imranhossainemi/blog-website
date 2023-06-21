require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET Posts/index' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Text of a page rendered' do
      expect(response.body).to include('Posts#index')
    end

    it 'Response status' do
      expect(response.status).to eq(200)
    end

    it 'Index template render' do
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'Posts', type: :request do
  describe 'GET Posts/show' do
    before(:each) do
      get '/users/1/posts/1'
    end

    it 'Show http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Show page text' do
      expect(response.body).to include('Posts#show')
    end

    it 'Show Response status' do
      expect(response.status).to eq(200)
    end

    it 'show template' do
      expect(response).to render_template('show')
    end
  end
end
