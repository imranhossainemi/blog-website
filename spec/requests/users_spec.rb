require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET Users' do
    before(:each) do
      get '/users'
    end

    it 'http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Text of a page rendered' do
      expect(response.body).to include('Welcome')
    end

    it 'Response status' do
      expect(response.status).to eq(200)
    end

    it 'Index template render' do
      expect(response).to render_template('index')
    end
  end
end

RSpec.describe 'Users', type: :request do
  describe 'GET Users/ID' do
    before(:each) do
      get '/users/3'
    end

    it 'Show http_status' do
      expect(response).to have_http_status(:success)
    end

    it 'Show page text' do
      expect(response.body).to include('User')
    end

    it 'Show Response status' do
      expect(response.status).to eq(200)
    end

    it 'show template' do
      expect(response).to render_template('show')
    end
  end
end
