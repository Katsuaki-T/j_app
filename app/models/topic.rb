class Topic < ApplicationRecord

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sentence

end
