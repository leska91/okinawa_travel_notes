class Area < ActiveHash::Base
  self.data = [
    { id: 1, name: '--' },
    { id: 2, name: '那覇空港' },
    { id: 3, name: '那覇' },
    { id: 4, name: '恩納' },
    { id: 5, name: '名護' },
    { id: 6, name: '本部' },
    { id: 7, name: '今帰仁' },
    { id: 8, name: '宜野湾' },
    { id: 9, name: '国頭' },
    { id: 10, name: '北谷' },
    { id: 11, name: '読谷' },
    { id: 12, name: '沖縄市' },
    { id: 13, name: 'うるま' },
    { id: 14, name: '糸満' },
    { id: 15, name: '豊見城' },
    { id: 16, name: '南城' },
    { id: 17, name: '宮古島' },
    { id: 18, name: '伊良部島' },
    { id: 19, name: '久米島' },
    { id: 20, name: '石垣島' },
    { id: 21, name: '西表島' },
    { id: 22, name: '小浜島' },
    { id: 23, name: '竹富島' },
    { id: 24, name: '波照間島' },
    { id: 25, name: '与那国島' },
    { id: 26, name: 'その他' }
  ]

  include ActiveHash::Associations
  has_many :records

end
