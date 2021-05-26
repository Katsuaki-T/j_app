class Sentence < ActiveHash::Base
  self.data = [
    
    { id: 1, name: '--' }, 
    { id: 2, name: '私(わたし)は 日本語(にほんご)を 勉強(べんきょう)します' }, 
    { id: 3, name: '私(わたし)は 日本語(にほんご)を 教(おし)えます' }, 
    { id: 4, name: '私(わたし)は 友達(ともだち)を 探(さが)します' },
    { id: 5, name: '私(わたし)は 特別(とくべつ)な 会(かい)を 開きます' }

  ]

  include ActiveHash::Associations
  has_many :topics
  
end
