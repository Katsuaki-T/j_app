class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :validatable, :omniauthable, omniauth_providers: [:facebook]
  with_options presence: true do
  validates :name
  validates :birth_country
  end
  validates :prefecture_id, numericality: { other_than: 1, message: "を選択してください" }

  
  has_many :topics
  has_many :comments
  has_one :sns_credential

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :prefecture

  def self.from_omniauth(auth)
    sns = SnsCredential.where(provider: auth.provider, uid: auth.uid).first_or_create
    # sns認証したことがあればアソシエーションで取得
    # 無ければemailでユーザー検索して取得orビルド(保存はしない)
    user = User.where(email: auth.info.email).first_or_initialize(
      name: auth.info.name,
      email: auth.info.email
  )
  end

end
