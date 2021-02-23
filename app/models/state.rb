class State < ActiveHash::Base
  self.data = [
    { id: 1, name: '変調を選択' },
    { id: 2, name: '故障' },
    { id: 3, name: 'マヒ' },
    { id: 4, name: '重傷' },
    { id: 5, name: '行方不明' },
    { id: 6, name: '忘却' },
    { id: 7, name: '呪い' },
    { id: 8, name: '催眠' },
    { id: 9, name: '火達磨' },
    { id: 10, name: '猛毒' },
    { id: 11, name: '飢餓' },
    { id: 12, name: '残刃' },
    { id: 13, name: '野望' }
  ]

  include ActiveHash::Associations
  has_many :conditions
end
