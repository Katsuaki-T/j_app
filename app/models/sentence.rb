class Prefecture < ActiveHash::Base
  self.data = [
    
    { id: 1, name: '--' }, 
    { id: 2, name: '私は 日本語を 勉強します' }, 
    { id: 3, name: '私は 日本語を 教えます' }, 
    { id: 4, name: '私は 友達を 探します' },
    { id: 5, name: '私は 特別な 会を 開きます' }

  ]

  include ActiveHash::Associations
  has_many :topics
  
end
