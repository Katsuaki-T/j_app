class Topic < ApplicationRecord

  validates :description, presence: true
  validates :sentence_id, numericality: { other_than: 1, message: "を選択してください" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sentence

  belongs_to :user
  has_many :comments

end
