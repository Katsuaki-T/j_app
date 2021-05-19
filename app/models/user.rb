class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
  validates :name
  validates :birth_country
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  
  has_many :topics

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

end
