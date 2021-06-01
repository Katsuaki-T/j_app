class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :omniauthable, omniauth_providers: [:facebook]

  with_options  presence: { message: "を 書(か)きましょう" } do
    validates :name
    validates :birth_country
  end

  validates :prefecture_id, numericality: { other_than: 1, message: "を 選(えら)びましょう" }

  with_options  presence: { message: "を 書(か)きましょう" } do
    validates :email
    validates :password
  end

  validates :email, uniqueness:  { message: "を 確認(かくにん)しましょう 同(おな)じメール(めーる)は使(つか)えません" }
  validates :password_confirmation, presence: { message: "も 書(か)きましょう" }
  validates :password, confirmation: { message: "と 初(はじ)めの暗証番号(あんしょう ばんごう)が 同(おな)じではないです" }
  validates :password, length: { minimum: 6 , message: "は 6字以上(じ いじょう)にしましょう"} 
  
  

  

  
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
  # userが登録済みであるか判断
   if user.persisted?
      sns.user = user
      sns.save
   end
   { user: user, sns: sns }
  end

end
