class Topic < ApplicationRecord

  validates :sentence_id, numericality: { other_than: 1, message: "を 選(えら)びましょう" }

  validates :description, presence: { message: "を 書(か)きましょう" }

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :sentence

  belongs_to :user
  has_many :comments

end
