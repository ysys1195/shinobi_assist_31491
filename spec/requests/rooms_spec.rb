require 'rails_helper'

RSpec.describe "Rooms", type: :request do

  before do
    @room = FactoryBot.create(:room)
  end

  describe 'GET /' do
    it 'indexアクションにリクエストすると正常にレスポンスが返ってくる' do
      get root_path
      expect(response.status).to eq 200
    end
  end

  describe 'GET /rooms/:token' do
    it 'showアクションにリクエストすると正常にレスポンスが返ってくる' do
      get room_path(@room)
      expect(response.status).to eq 302
    end
  end
end
