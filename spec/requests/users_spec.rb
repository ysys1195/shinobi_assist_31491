require 'rails_helper'

RSpec.describe 'Users', type: :request do

  before do
    @user = FactoryBot.create(:user)
  end

  describe 'GET /users/:id' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
    get user_path(@user)
    expect(response.status).to eq 302
    end
  end
end
