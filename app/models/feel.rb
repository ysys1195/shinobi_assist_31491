class Feel < ActiveHash::Base
  self.data = [
    { id: 1, name: '感情を選択' },
    { id: 2, name: '共感(プラス)' },
    { id: 3, name: '不信(マイナス)' },
    { id: 4, name: '友情(プラス)' },
    { id: 5, name: '怒り(マイナス)' },
    { id: 6, name: '愛情(プラス)' },
    { id: 7, name: '妬み(マイナス)' },
    { id: 8, name: '忠誠(プラス)' },
    { id: 9, name: '侮蔑(マイナス)' },
    { id: 10, name: '憧憬(プラス)' },
    { id: 11, name: '劣等感(マイナス)' },
    { id: 12, name: '狂信(プラス)' },
    { id: 13, name: '殺意(マイナス)' }
  ]

  include ActiveHash::Associations
  has_many :feelings
end
