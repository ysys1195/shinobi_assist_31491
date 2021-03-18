require 'rails_helper'

RSpec.describe OpenSecret, type: :model do
  describe '秘密公開か非公開の保存' do
    before do
      @open_secret = FactoryBot.build(:open_secret)
    end

    it '全て正しく入力されていると保存される' do
      expect(@open_secret).to be_valid
    end
    it 'secret_unveil_toが空だと保存できない' do
      @open_secret.secret_unveil_to = ''
      @open_secret.valid?
      expect(@open_secret.errors.full_messages).to include("Secret unveil to can't be blank")
    end
    it 'unveiled_idが空だと保存できない' do
      @open_secret.unveiled_id = ''
      @open_secret.valid?
      expect(@open_secret.errors.full_messages).to include("Unveiled can't be blank")
    end
    it 'unveiled_idが1か2以外だと保存できない' do
      @open_secret.unveiled_id = 3
      @open_secret.valid?
      expect(@open_secret.errors.full_messages).to include('Unveiled is not included in the list')
    end
    it 'secretと紐づいていないと保存できない' do
      @open_secret.secret = nil
      @open_secret.valid?
      expect(@open_secret.errors.full_messages).to include('Secret must exist')
    end
  end
end
