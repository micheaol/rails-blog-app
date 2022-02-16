require 'rails_helper'

RSpec.describe "Posts", type: :request do
  describe 'GET #index' do
    before(:each) do
      get user_posts_path(745)
    end

    it 'should have the correct response status' do
      expect(response).to have_http_status(:ok)
    end
end
