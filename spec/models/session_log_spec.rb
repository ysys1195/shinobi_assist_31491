require 'rails_helper'

RSpec.describe SessionLog, type: :model do
  describe 'セッション履歴の保存' do
    before do
      @session_log = FactoryBot.build(:session_log)
    end

    it '全て正しく入力されていれば保存される' do
      expect(@session_log).to be_valid
    end
    it 'titleが空だと保存されない' do
      @session_log.title = ''
      @session_log.valid?
      expect(@session_log.errors.full_messages).to include('表題を入力してください')
    end
    it 'logが空だと保存されない' do
      @session_log.log = ''
      @session_log.valid?
      expect(@session_log.errors.full_messages).to include('セッション内容を入力してください')
    end
    it 'userと紐づいていないと保存されない' do
      @session_log.user = nil
      @session_log.valid?
      expect(@session_log.errors.full_messages).to include('Userを入力してください')
    end
    it 'roomと紐づいていないと保存されない' do
      @session_log.room = nil
      @session_log.valid?
      expect(@session_log.errors.full_messages).to include('Roomを入力してください')
    end
  end
end
